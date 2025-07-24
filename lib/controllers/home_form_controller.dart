import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gsm_pay_task/controllers/custom_text_field_controller.dart';
import 'package:gsm_pay_task/core/api/api_exception.dart';
import 'package:gsm_pay_task/core/api/api_result_model.dart';
import 'package:gsm_pay_task/models/submit_form/submit_form_request_model.dart';
import 'package:gsm_pay_task/models/upload_image/upload_image_request_model.dart';
import 'package:gsm_pay_task/models/upload_image/upload_image_response_model.dart';
import 'package:gsm_pay_task/services/api/api_service.dart';
import 'package:gsm_pay_task/utils/image_utils.dart';
import 'package:gsm_pay_task/utils/validation_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toastification/toastification.dart';
import 'package:uuid/v4.dart';

class HomeFormController extends GetxController {
  HomeFormController({required this.apiService});

  final ApiService apiService;

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  // National Card
  final Rxn<XFile> _nationalCardImage = Rxn();
  XFile? get nationalCardImage => _nationalCardImage.value;

  final RxBool _isNationalCardUploading = false.obs;
  bool get isNationalCardUploading => _isNationalCardUploading.value;

  final RxnString _nationalCardImageId = RxnString();
  String? get nationalCardImageId => _nationalCardImageId.value;
  //

  // Birth Certificate
  final Rxn<XFile> _birthCertificateImage = Rxn();
  XFile? get birthCertificateImage => _birthCertificateImage.value;

  final RxBool _isBirthCertificateUploading = false.obs;
  bool get isBirthCertificateUploading => _isBirthCertificateUploading.value;

  final RxnString _birthCertificateImageId = RxnString();
  String? get birthCertificateImageId => _birthCertificateImageId.value;
  //

  late CustomTextFieldController fullNameTextFieldController = CustomTextFieldController(
    validateCallBack: _validateFullName,
  );
  late CustomTextFieldController nationalCodeTextFieldController = CustomTextFieldController(
    validateCallBack: _validateNationalCode,
  );
  late CustomTextFieldController montlySalaryTextFieldController = CustomTextFieldController(
    validateCallBack: _validateMontlySalary,
  );

  void _validateFullName() {
    if (fullNameTextFieldController.text.length < 5) {
      fullNameTextFieldController.setError('لطفا نام خود را به صورت کامل وارد کنید.');
    } else {
      fullNameTextFieldController.removeError();
    }
  }

  void _validateNationalCode() {
    if (!ValidationUtil.isValidNationalCode(nationalCodeTextFieldController.text)) {
      nationalCodeTextFieldController.setError('کد ملی خود را به صورت صحیح وارد کنید.');
    } else {
      nationalCodeTextFieldController.removeError();
    }
  }

  void _validateMontlySalary() {
    final text = montlySalaryTextFieldController.text.replaceAll(',', 'replace');
    if (text.isEmpty) {
      montlySalaryTextFieldController.removeError();
    } else {
      if (text.length < 5) {
        montlySalaryTextFieldController.setError('حقوق ماهیانه باید بیشنر از 10000 ریال باشد.');
      } else {
        montlySalaryTextFieldController.removeError();
      }
    }
  }

  Future<void> chooseNationalCardFromGalleryAndUpload() async {
    final XFile? image = await ImageUtils.pickAndCropImage(
      ratioY: 3,
      ratioX: 5,
    );

    if (image == null) {
      return; // User canceled the picker
    }

    final requestModel = UploadImageRequestModel(
      imageBytes: await image.readAsBytes(),
      imageName: '${const UuidV4().generate()}.jpg',
    );

    _isNationalCardUploading.value = true;
    await apiService.uploadImageRequest(requestModel: requestModel).then((result) {
      switch (result) {
        case Success(value: (final UploadImageResponseModel response, int _)):
          _nationalCardImage.value = image;
          _nationalCardImageId.value = response.imageId;
          toastification.show(
            title: const Text('تصویر کارت ملی با موفقیت آپلود شد.'),
            type: ToastificationType.success,
            autoCloseDuration: const Duration(seconds: 2),
            alignment: Alignment.bottomCenter,
          );
        case Failure(exception: final ApiException apiException):
          toastification.show(
            title: Text(apiException.displayMessage),
            type: ToastificationType.error,
            autoCloseDuration: const Duration(seconds: 2),
            alignment: Alignment.bottomCenter,
          );
      }
      _isNationalCardUploading.value = false;
    });
  }

  void removeNationalCardImage() {
    _nationalCardImage.value = null;
    _nationalCardImageId.value = null;
  }

  Future<void> chooseBirthCertificateFromGalleryAndUpload() async {
    final XFile? image = await ImageUtils.pickAndCropImage();

    if (image == null) {
      return; // User canceled the picker
    }

    final requestModel = UploadImageRequestModel(
      imageBytes: await image.readAsBytes(),
      imageName: '${const UuidV4().generate()}.jpg',
    );

    _isBirthCertificateUploading.value = true;
    await apiService.uploadImageRequest(requestModel: requestModel).then((result) {
      switch (result) {
        case Success(value: (final UploadImageResponseModel response, int _)):
          _birthCertificateImage.value = image;
          _birthCertificateImageId.value = response.imageId;
          toastification.show(
            title: const Text('تصویر شناسنامه با موفقیت آپلود شد.'),
            type: ToastificationType.success,
            autoCloseDuration: const Duration(seconds: 2),
            alignment: Alignment.bottomCenter,
          );
        case Failure(exception: final ApiException apiException):
          toastification.show(
            title: Text(apiException.displayMessage),
            type: ToastificationType.error,
            autoCloseDuration: const Duration(seconds: 2),
            alignment: Alignment.bottomCenter,
          );
      }
      _isBirthCertificateUploading.value = false;
    });
  }

  void removeBirthCertificateImage() {
    _birthCertificateImage.value = null;
    _birthCertificateImageId.value = null;
  }

  void submit() {
    if (isLoading) {
      return;
    }
    if (!_validateForm()) {
      return;
    }

    _isLoading.value = true;

    final requestModel = SubmitFormRequestModel(
      name: fullNameTextFieldController.text,
      nationalCode: nationalCodeTextFieldController.text,
      salary: int.parse(montlySalaryTextFieldController.text.replaceAll(',', '')),
      nationalCardImageId: nationalCardImageId!,
      birthCertificateImageId: birthCertificateImageId!,
    );

    apiService.submitFormRequest(requestModel: requestModel).then((result) {
      switch (result) {
        case Success(value: _):
          toastification.show(
            title: const Text('فرم با موفقیت ارسال شد.'),
            type: ToastificationType.success,
            autoCloseDuration: const Duration(seconds: 2),
            alignment: Alignment.bottomCenter,
          );
        case Failure(exception: final ApiException apiException):
          toastification.show(
            title: Text(apiException.displayMessage),
            type: ToastificationType.error,
            autoCloseDuration: const Duration(seconds: 2),
            alignment: Alignment.bottomCenter,
          );
      }
      _isLoading.value = false;
    });
  }

  bool _validateForm() {
    _validateFullName();
    _validateNationalCode();
    _validateMontlySalary();

    final inputs = [fullNameTextFieldController, nationalCodeTextFieldController, montlySalaryTextFieldController];

    if (inputs.every((textController) => textController.text.isEmpty)) {
      toastification.show(
        title: const Text('لطفا اطلاعات خواسته شده را وارد کنید.'),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 2),
        alignment: Alignment.bottomCenter,
      );
      return false;
    }
    if (nationalCardImageId == null || birthCertificateImageId == null) {
      toastification.show(
        title: const Text('لطفا تصاویر را انتخاب کنید.'),
        type: ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 2),
        alignment: Alignment.bottomCenter,
      );
      return false;
    }

    return true;
  }
}
