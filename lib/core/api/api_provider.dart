import 'package:gsm_pay_task/core/api/api_method_enum.dart';

class ApiProvider {
  ApiProvider({
    required this.path,
    required this.method,
    required this.successStatusCodes,
    required this.failureStatusCodes,
  });

  final String path;
  final ApiMethod method;
  final List<int> successStatusCodes;
  final List<int> failureStatusCodes;
  final Duration receiveTimeout = const Duration(seconds: 60);
  final Duration sendTimeout = const Duration(seconds: 60);
}
