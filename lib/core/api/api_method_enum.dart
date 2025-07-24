enum ApiMethod {
  get('GET'),
  put('PUT'),
  post('POST'),
  patch('PATCH'),
  delete('DELETE'),
  head('HEAD');

  const ApiMethod(this.methodName);

  final String methodName;
}
