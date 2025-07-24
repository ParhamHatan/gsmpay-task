import 'package:dio/dio.dart';

abstract class ApiJsonRequestModel {
  Map<String, dynamic> toJson();
}

abstract class ApiFormDataRequestModel {
  FormData toFormData();
}
