import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
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
    @required this.facebookLogin,
  });

  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FacebookLogin facebookLogin;
  @override
  Future<void> logout() async {
    try {
      //TODO: Sair do Google Account junto com FirebaseAuth é necessário?
      final currentUser = await firebaseAuth.currentUser();
      final isSignedIng = await googleSignIn.isSignedIn();
      final isSignedInf = await facebookLogin.isLoggedIn;
      if (isSignedIng) {
        googleSignIn.disconnect();
      }
      if (isSignedInf) {
        facebookLogin.logOut();
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
