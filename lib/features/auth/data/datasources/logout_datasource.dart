import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:meta/meta.dart';

abstract class LogoutDataSource {
  /// Faz requisição local para o serviço de autenticação
  /// do Firebase para desconectar o usuário atual.
  ///
  /// Dispara uma [FirebaseLogoutException] com a mensagem de erro.
  Future<void> logout();
}

class LogoutDataSourceImpl implements LogoutDataSource {
  LogoutDataSourceImpl({
    @required this.firebaseAuth,
    @required this.googleSignIn,
  });

  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  @override
  Future<void> logout() async {
    try {
      //TODO: Sair do Google Account junto com FirebaseAuth é necessário?
      final currentUser = await firebaseAuth.currentUser();
      final isSignedIn = await googleSignIn.isSignedIn();
      if (isSignedIn) {
        googleSignIn.disconnect();
      }
      if (currentUser == null) {
        throw FirebaseLogoutException();
      }
      firebaseAuth.signOut();
    } catch (error) {
      throw FirebaseLogoutException();
    }
  }
}
