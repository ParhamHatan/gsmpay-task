import 'package:gsm_pay_task/core/api/api_error_response_model.dart';
import 'package:gsm_pay_task/core/api/api_exception_type.dart';

class ApiException<R extends ApiErrorResponseModel> implements Exception {
  ApiException({
    required this.type,
    required this.statusCode,
    required this.displayMessage,
    this.errorResponse,
  });

  final ApiExceptionType type;
  final int? statusCode;
  final String displayMessage;
  R? errorResponse;
}
