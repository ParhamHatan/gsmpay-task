import 'package:gsm_pay_task/core/api/api_request_model.dart';

class SubmitFormRequestModel implements ApiJsonRequestModel {
  SubmitFormRequestModel({
    required this.name,
    required this.nationalCode,
    required this.salary,
    required this.nationalCardImageId,
    required this.birthCertificateImageId,
  });

  final String name;
  final String nationalCode;
  final int salary;
  final String nationalCardImageId;
  final String birthCertificateImageId;

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'nationalCode': nationalCode,
    'salary': salary,
    'nationalCardImageId': nationalCardImageId,
    'birthCertificateImageId': birthCertificateImageId,
  };
}
