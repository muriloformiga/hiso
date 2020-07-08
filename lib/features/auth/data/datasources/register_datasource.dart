import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/features/auth/domain/entities/auth_user.dart';
import 'package:meta/meta.dart';

abstract class RegisterDataSource {
  /// Faz requisição de criação de conta para o serviço
  /// de autenticação do Firebase usando e-mail e senha.
  ///
  /// Dispara uma [FirebaseRegisterException] com a mensagem de erro.
  Future<AuthUser> registerWithEmail(
    String email,
    String password,
  );
}

class RegisterDataSourceImpl implements RegisterDataSource {
  RegisterDataSourceImpl({@required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  @override
  Future<AuthUser> registerWithEmail(String email, String password) async {
    try {
      final authResult = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthUser(firebaseUser: authResult.user);
    } catch (error) {
      throw FirebaseRegisterException(code: error.code);
    }
  }
}
