import 'package:gsm_pay_task/core/api/api_exception.dart';

sealed class ApiResult<S, E extends ApiException> {
  const ApiResult();
}

final class Success<S, E extends ApiException> extends ApiResult<S, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S, E extends ApiException> extends ApiResult<S, E> {
  const Failure(this.exception);
  final E exception;
}
