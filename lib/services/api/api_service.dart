import 'package:get/get.dart';
import 'package:gsm_pay_task/core/api/api_exception.dart';
import 'package:gsm_pay_task/core/api/api_method_enum.dart';
import 'package:gsm_pay_task/core/api/api_provider.dart';
import 'package:gsm_pay_task/core/api/api_result_model.dart';
import 'package:gsm_pay_task/models/submit_form/submit_form_request_model.dart';
import 'package:gsm_pay_task/models/submit_form/submit_form_response_model.dart';
import 'package:gsm_pay_task/models/upload_image/upload_image_request_model.dart';
import 'package:gsm_pay_task/models/upload_image/upload_image_response_model.dart';
import 'package:gsm_pay_task/services/api/api_client_service.dart';

class ApiService extends GetxService {
  ApiService({required ApiClientService client}) : _client = client;

  final ApiClientService _client;

  Future<ApiResult<(UploadImageResponseModel, int), ApiException>> uploadImageRequest({
    required UploadImageRequestModel requestModel,
  }) async {
    final provider = ApiProvider(
      path: '/upload',
      method: ApiMethod.post,
      successStatusCodes: [200],
      failureStatusCodes: [400],
    );
    return _client.requestFormData(
      apiProvider: provider,
      data: requestModel,
      modelFromJson: (responseBody, statusCode) => UploadImageResponseModel.fromJson(responseBody),
    );
  }

  Future<ApiResult<(SubmitFormResponseModel, int), ApiException>> submitFormRequest({
    required SubmitFormRequestModel requestModel,
  }) async {
    final provider = ApiProvider(
      path: '/submit',
      method: ApiMethod.post,
      successStatusCodes: [200],
      failureStatusCodes: [400],
    );
    return _client.requestJson(
      apiProvider: provider,
      data: requestModel,
      modelFromJson: (responseBody, statusCode) => SubmitFormResponseModel.fromJson(responseBody),
    );
  }
}
