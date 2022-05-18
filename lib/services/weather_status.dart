import 'package:equatable/equatable.dart';

class Success {
  final int statusCode;
  final dynamic data;

  Success({required this.statusCode, required this.data});
}

class Failure extends Equatable {
  final int statusCode;
  final String message;

  const Failure({required this.statusCode, required this.message});

  @override
  List<Object?> get props => [statusCode, message];
}
