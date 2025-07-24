import 'package:dio/dio.dart';
import 'package:gsm_pay_task/core/api/api_request_model.dart';

class UploadImageRequestModel implements ApiFormDataRequestModel {
  UploadImageRequestModel({required this.imageBytes, required this.imageName});

  final List<int> imageBytes;
  final String imageName;

  @override
  FormData toFormData() => FormData.fromMap({'image': MultipartFile.fromBytes(imageBytes, filename: imageName)});
}
