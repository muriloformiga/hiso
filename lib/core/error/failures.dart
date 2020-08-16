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

class FirebaseRegisterFailure extends Failure {
  FirebaseRegisterFailure({@required String message}) : super(message: message);
}

class FirebaseLogoutFailure extends Failure {
  FirebaseLogoutFailure({
    String message = 'Falha ao sair, reinicie a aplicação.',
  }) : super(message: message);
}

class FirestoreFailure extends Failure {
  FirestoreFailure({
    String message = 'Não foi possível acessar o servidor.',
  }) : super(message: message);
}

class FirestoreNotFoundFailure extends Failure {
  FirestoreNotFoundFailure({
    String message = 'Dados não encontrados no servidor.',
  }) : super(message: message);
}

class FirestorePacientAlreadyExistsFailure extends Failure {
  FirestorePacientAlreadyExistsFailure({
    String message = 'Erro: O paciente já foi cadastrado no sistema.',
  }) : super(message: message);
}
