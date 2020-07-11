import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/info/firebase_info.dart';
import 'package:hiso/core/singletons/user.dart';
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

  /// Faz requisição para salvar dados de usuário
  ///  para o serviço de armazenamento do Firebase.
  ///
  /// Dispara uma [FirestoreException] com a mensagem de erro.
  Future<void> registerUserData(
    Map<String, dynamic> data,
  );
}

class RegisterDataSourceImpl implements RegisterDataSource {
  RegisterDataSourceImpl({
    @required this.firebaseAuth,
    @required this.firestore,
  });

  final FirebaseAuth firebaseAuth;
  final Firestore firestore;

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

  @override
  Future<void> registerUserData(Map<String, dynamic> data) async {
    try {
      firestore
          .collection(FirebaseInfo.usersCollection)
          .document(User.instance.userId)
          .setData(data);
    } catch (error) {
      throw FirestoreException(code: error.code);
    }
  }
}
