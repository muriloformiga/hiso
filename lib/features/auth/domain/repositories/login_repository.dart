import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, FirebaseUser>> loginWithEmail(
    String email,
    String password,
  );

  Future<Either<Failure, FirebaseUser>> loginWithGoogle();

  Future<Either<Failure, FirebaseUser>> loginWithFacebook();

  Future<Either<Failure, FirebaseUser>> loginWithTwitter();
}
