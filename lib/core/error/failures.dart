import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Failure extends Equatable {
  Failure({@required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

// General failures
class NetworkFailure extends Failure {
  NetworkFailure({
    String message = 'Não há internet.',
  }) : super(message: message);
}

// Expecifics failures
class FirebaseLoginFailure extends Failure {
  FirebaseLoginFailure({@required String message}) : super(message: message);
}

class FirebaseLogoutFailure extends Failure {
  FirebaseLogoutFailure({
    String message = 'Falha ao sair, reinicie a aplicação.',
  }) : super(message: message);
}
