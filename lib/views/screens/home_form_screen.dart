import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gsm_pay_task/controllers/home_form_controller.dart';
import 'package:gsm_pay_task/utils/money_text_input_formatter.dart';
import 'package:gsm_pay_task/views/extensions/typography_context_extension.dart';
import 'package:gsm_pay_task/views/widgets/custom_filled_loading_button.dart';
import 'package:gsm_pay_task/views/widgets/custom_text_field.dart';
import 'package:gsm_pay_task/views/widgets/image_picker_widget.dart';

class HomeFormScreen extends GetView<HomeFormController> {
  const HomeFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/gsmpay_logo.svg',
                          height: 50,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'فرم اطلاعات کاربری',
                          style: context.typography.title,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'لطفا اطلاعات خود را وارد کنید',
                          style: context.typography.description,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Obx(
                          () => CustomTextField(
                            labelText: 'نام',
                            hintText: 'نام خود را به صورت کامل به فارسی وارد کنید',
                            textInputAction: TextInputAction.next,
                            controller: controller.fullNameTextFieldController.textController,
                            errorText: controller.fullNameTextFieldController.errorText,
                            isValid: controller.fullNameTextFieldController.isValid,
                            onSubmitted: controller.fullNameTextFieldController.validateCallBack,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(
                          () => CustomTextField(
                            labelText: 'کد ملی',
                            hintText: 'کد ملی خود را وارد کنید',
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            controller: controller.nationalCodeTextFieldController.textController,
                            errorText: controller.nationalCodeTextFieldController.errorText,
                            isValid: controller.nationalCodeTextFieldController.isValid,
                            onSubmitted: controller.nationalCodeTextFieldController.validateCallBack,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(
                          () => CustomTextField(
                            labelText: 'حقوق ماهیانه (اختیاری)',
                            hintText: 'حقوق ماهیانه خود را به ریال وارد کنید',
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              MoneyTextInputFormatter(),
                            ],
                            controller: controller.montlySalaryTextFieldController.textController,
                            errorText: controller.montlySalaryTextFieldController.errorText,
                            isValid: controller.montlySalaryTextFieldController.isValid,
                            onSubmitted: controller.montlySalaryTextFieldController.validateCallBack,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(
                          () => ImagePickerWidget(
                            title: 'تصویر کارت ملی',
                            isLoading: controller.isNationalCardUploading,
                            image: controller.nationalCardImage,
                            imageId: controller.nationalCardImageId,
                            onPressed: controller.chooseNationalCardFromGalleryAndUpload,
                            onRemove: controller.removeNationalCardImage,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(
                          () => ImagePickerWidget(
                            title: 'تصویر شناسنامه',
                            isLoading: controller.isBirthCertificateUploading,
                            image: controller.birthCertificateImage,
                            imageId: controller.birthCertificateImageId,
                            onPressed: controller.chooseBirthCertificateFromGalleryAndUpload,
                            onRemove: controller.removeBirthCertificateImage,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(
                          height: 24,
                        ),
                        Obx(
                          () => CustomFilledLoadingButton(
                            title: 'ثبت اطلاعات',
                            onPressed: controller.submit,
                            isLoading: controller.isLoading,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
