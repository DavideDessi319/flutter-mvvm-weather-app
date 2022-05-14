class ResponseSuccess {
  final int statusCode;
  final dynamic data;

  ResponseSuccess({required this.statusCode, required this.data});
}

class ResponseError {
  final int statusCode;
  final String message;

  ResponseError({required this.statusCode, required this.message});
}
