import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:meta/meta.dart';
import 'package:hiso/core/network/network_info.dart';
import 'package:hiso/features/auth/data/datasources/login_datasource.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/features/auth/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({
    @required this.loginDataSource,
    @required this.networkInfo,
  });

  final LoginDataSource loginDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, FirebaseUser>> loginWithEmail(
    String email,
    String password,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await loginDataSource.loginWithEmail(email, password);
        return Right(user);
      } on FirebaseLoginException catch (e) {
        String errorMessage = '';
        switch (e.code) {
          case 'ERROR_INVALID_EMAIL':
            errorMessage = 'O seu endereço de email parece estar incorreto.';
            break;
          case 'ERROR_WRONG_PASSWORD':
            errorMessage = 'Sua senha está errada.';
            break;
          case 'ERROR_USER_NOT_FOUND':
            errorMessage = 'Usuário com este e-mail não existe.';
            break;
          case 'ERROR_USER_DISABLED':
            errorMessage = 'O usuário com este email foi desativado.';
            break;
          case 'ERROR_TOO_MANY_REQUESTS':
            errorMessage = 'Muitas requisições. Tente mais tarde.';
            break;
          case 'ERROR_OPERATION_NOT_ALLOWED':
            errorMessage = 'O login com email e senha não está ativado.';
            break;
          default:
            errorMessage = 'Um erro inesperado aconteceu.';
        }
        return Left(FirebaseLoginFailure(message: errorMessage));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, FirebaseUser>> loginWithFacebook() async {
    if (await networkInfo.isConnected) {
      try {
        final user = await loginDataSource.loginWithFacebook();
        return Right(user);
      } on FirebaseLoginException catch (e) {
        String errorMessage = '';
        switch (e.code) {
          case 'ERROR_INVALID_CREDENTIAL':
            errorMessage =
                'If the credential data is malformed or has expired.';
            break;
          case 'ERROR_USER_DISABLED':
            errorMessage =
                'If the user has been disabled (for example, in the Firebase console).';
            break;
          case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
            // Resolve this case by calling [fetchSignInMethodsForEmail] and then asking the user to sign in using one of them.
            // This error will only be thrown if the "One account per email address" setting is enabled in the Firebase console (recommended).
            errorMessage =
                'If there already exists an account with the email address asserted by Google.';
            break;
          case 'ERROR_OPERATION_NOT_ALLOWED':
            errorMessage = 'Indicates that Google accounts are not enabled.';
            break;
          case 'ERROR_INVALID_ACTION_CODE':
            // This can only occur when using [EmailAuthProvider.getCredentialWithLink] to obtain the credential.
            errorMessage =
                'If the action code in the link is malformed, expired, or has already been used.';
            break;
          default:
            errorMessage = 'Um erro inesperado aconteceu.';
        }
        return Left(FirebaseLoginFailure(message: errorMessage));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, FirebaseUser>> loginWithGoogle() async {
    if (await networkInfo.isConnected) {
      try {
        final user = await loginDataSource.loginWithGoogle();
        return Right(user);
      } on FirebaseLoginException catch (e) {
        String errorMessage = '';
        switch (e.code) {
          case 'ERROR_INVALID_CREDENTIAL':
            errorMessage =
                'If the credential data is malformed or has expired.';
            break;
          case 'ERROR_USER_DISABLED':
            errorMessage =
                'If the user has been disabled (for example, in the Firebase console).';
            break;
          case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
            // Resolve this case by calling [fetchSignInMethodsForEmail] and then asking the user to sign in using one of them.
            // This error will only be thrown if the "One account per email address" setting is enabled in the Firebase console (recommended).
            errorMessage =
                'If there already exists an account with the email address asserted by Google.';
            break;
          case 'ERROR_OPERATION_NOT_ALLOWED':
            errorMessage = 'Indicates that Google accounts are not enabled.';
            break;
          case 'ERROR_INVALID_ACTION_CODE':
            // This can only occur when using [EmailAuthProvider.getCredentialWithLink] to obtain the credential.
            errorMessage =
                'If the action code in the link is malformed, expired, or has already been used.';
            break;
          default:
            errorMessage = 'Um erro inesperado aconteceu.';
        }
        return Left(FirebaseLoginFailure(message: errorMessage));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, FirebaseUser>> loginWithTwitter() {
    throw UnimplementedError();
  }
}
