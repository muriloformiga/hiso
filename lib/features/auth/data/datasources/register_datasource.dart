import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:meta/meta.dart';

abstract class RegisterDataSource {
  /// Faz requisição de criação de conta para o serviço
  /// de autenticação do Firebase usando e-mail e senha.
  ///
  /// Dispara uma [FirebaseRegisterException] com a mensagem de erro.
  Future<FirebaseUser> registerWithEmail(
    String email,
    String password,
  );

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<FirebaseUser> registerWithFacebook();

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<FirebaseUser> registerWithGoogle();

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<FirebaseUser> registerWithTwitter();
}

class RegisterDataSourceImpl implements RegisterDataSource {
  RegisterDataSourceImpl({@required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  @override
  Future<FirebaseUser> registerWithEmail(String email, String password) async {
    try {
      final authResult = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } catch (error) {
      throw FirebaseRegisterException(code: error.code);
    }
  }

  @override
  Future<FirebaseUser> registerWithFacebook() {
    // TODO: implement getRegisterWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> registerWithGoogle() {
    // TODO: implement getRegisterWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> registerWithTwitter() {
    // TODO: implement getRegisterWithTwitter
    throw UnimplementedError();
  }
}
