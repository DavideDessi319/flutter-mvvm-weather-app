class Success {
  final int statusCode;
  final dynamic data;

  Success({required this.statusCode, required this.data});
}

class Failure {
  final int statusCode;
  final String message;

  Failure({required this.statusCode, required this.message});
}
