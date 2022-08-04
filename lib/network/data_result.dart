class DataResult<T> {
  T? onSuccess;
  Error? onError;

  // setSuccess(T data) => _onSuccessData = data;
  //
  // setError(Error data) => _onErrorData = data;
  //
  // T? onSuccess() => _onSuccessData;
  //
  // Error? onError() => _onErrorData;

  DataResult({this.onSuccess, this.onError});
}

class Error {
  String? message;
  String? statusCode;
  String? reasonPhrase;

  Error({this.message, this.statusCode, this.reasonPhrase});
}
