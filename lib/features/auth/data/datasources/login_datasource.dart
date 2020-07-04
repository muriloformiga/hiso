import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:meta/meta.dart';

abstract class LoginDataSource {
  /// Faz requisição de login para o serviço de
  /// autenticação do Firebase usando e-mail e senha.
  ///
  /// Dispara uma [FirebaseLoginException] com a mensagem de erro.
  Future<FirebaseUser> loginWithEmail(
    String email,
    String password,
  );

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<FirebaseUser> loginWithFacebook();

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<FirebaseUser> loginWithGoogle();
}

class LoginDataSourceImpl implements LoginDataSource {
  LoginDataSourceImpl({
    @required this.firebaseAuth,
    @required this.googleSignIn,
    @required this.facebookLogin,
  });

  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FacebookLogin facebookLogin;

  @override
  Future<FirebaseUser> loginWithEmail(String email, String password) async {
    try {
      final authResult = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user;
    } catch (error) {
      throw FirebaseLoginException(code: error.code);
    }
  }

  @override
  Future<FirebaseUser> loginWithFacebook() async {
    try {
      FirebaseUser user;
      final bool isSignedIn = await facebookLogin.isLoggedIn;
      if (isSignedIn) {
        user = await firebaseAuth.currentUser();
      } else {
        final FacebookLoginResult result =
            await facebookLogin.logIn(['email', 'public_profile']);
        final FacebookAccessToken accessToken = result.accessToken;

        final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: accessToken.token,
        );
        final authResult = await firebaseAuth.signInWithCredential(credential);
        user = authResult.user;
      }
      return user;
    } catch (error) {
      throw FirebaseLoginException(code: error.code);
    }
  }

  @override
  Future<FirebaseUser> loginWithGoogle() async {
    try {
      FirebaseUser user;
      final bool isSignedIn = await googleSignIn.isSignedIn();
      if (isSignedIn) {
        user = await firebaseAuth.currentUser();
      } else {
        final GoogleSignInAccount googleUser = await googleSignIn.signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final authResult = await firebaseAuth.signInWithCredential(credential);
        user = authResult.user;
      }
      return user;
    } catch (error) {
      throw FirebaseLoginException(code: error.code);
    }
  }
}
