import 'package:dio/dio.dart';
import 'package:gsm_pay_task/core/api/api_error_response_model.dart';
import 'package:gsm_pay_task/core/api/api_exception.dart';
import 'package:gsm_pay_task/core/api/api_provider.dart';
import 'package:gsm_pay_task/core/api/api_request_model.dart';
import 'package:gsm_pay_task/core/api/api_result_model.dart';
import 'package:uuid/v4.dart';

class ApiClientService {
  Future<ApiResult<(T responseModel, int statusCode), ApiException<R>>>
  requestJson<T, R extends ApiErrorResponseModel>({
    required ApiProvider apiProvider,
    required T Function(Map<String, dynamic> responseBody, int statusCode) modelFromJson,
    String? slug,
    ApiJsonRequestModel? data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? additionalHeaders,
    R Function(Map<String, dynamic> responseBody, int statusCode)? errorModelFromJson,
  }) async {
    return _sendRequest(
      apiProvider: apiProvider,
      modelFromJson: modelFromJson,
      data: data?.toJson(),
      contentType: data != null ? Headers.jsonContentType : null,
      errorModelFromJson: errorModelFromJson,
    );
  }

  Future<ApiResult<(T responseModel, int statusCode), ApiException<R>>>
  requestFormData<T, R extends ApiErrorResponseModel>({
    required ApiProvider apiProvider,
    required T Function(Map<String, dynamic> responseBody, int statusCode) modelFromJson,
    ApiFormDataRequestModel? data,
    R Function(Map<String, dynamic> responseBody, int statusCode)? errorModelFromJson,
  }) async {
    return _sendRequest(
      apiProvider: apiProvider,
      modelFromJson: modelFromJson,
      data: data?.toFormData(),
      contentType: data != null ? Headers.multipartFormDataContentType : null,
      errorModelFromJson: errorModelFromJson,
    );
  }

  Future<ApiResult<(T responseModel, int statusCode), ApiException<R>>>
  _sendRequest<T, R extends ApiErrorResponseModel>({
    required ApiProvider apiProvider,
    required T Function(Map<String, dynamic> responseBody, int statusCode) modelFromJson,
    Object? data,
    String? contentType,
    R Function(Map<String, dynamic> responseBody, int statusCode)? errorModelFromJson,
  }) async {
    // Check network
    // Create dio request with input options
    // Check response status code and handle different situations and exceptions

    // Mock
    print(data);
    await Future<void>.delayed(const Duration(seconds: 2));
    if (apiProvider.path == '/upload') {
      final json = {'imageId': const UuidV4().generate()};
      print(json);
      final parsed = modelFromJson(json, 200);
      return Success((parsed, 200));
    } else {
      final json = {'isSuccess': true};
      print(json);
      final parsed = modelFromJson(json, 200);
      return Success((parsed, 200));
    }
  }
}
