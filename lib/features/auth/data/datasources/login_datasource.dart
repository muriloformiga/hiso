import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<FirebaseUser> loginWithTwitter();
}

class LoginDataSourceImpl implements LoginDataSource {
  LoginDataSourceImpl({
    @required this.firebaseAuth,
    @required this.googleSignIn,
  });

  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

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
  Future<FirebaseUser> loginWithFacebook() {
    //TODO: implement loginWithFacebook
    throw UnimplementedError();
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
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final authResult = await firebaseAuth.signInWithCredential(credential);
        user = authResult.user;
      }
      return user;
    } catch (error) {
      throw FirebaseLoginException(code: error.code);
    }
  }

  @override
  Future<FirebaseUser> loginWithTwitter() {
    // TODO: implement loginWithTwitter
    throw UnimplementedError();
  }
}
