import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ServerException implements Exception {}

class FirebaseLoginException extends Equatable implements Exception {
  FirebaseLoginException({@required this.code});

  final String code;

  @override
  List<Object> get props => [code];
}

class FirebaseLogoutException extends Equatable implements Exception {
  @override
  List<Object> get props => [];
}

class FirebaseRegisterException extends Equatable implements Exception {
  FirebaseRegisterException({@required this.code});

  final String code;

  @override
  List<Object> get props => [code];
}
