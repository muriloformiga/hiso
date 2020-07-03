import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/error/failures.dart';

abstract class RegisterRepository {
  Future<Either<Failure, FirebaseUser>> registerWithEmail(
    String email,
    String password,
  );

  Future<Either<Failure, FirebaseUser>> registerWithGoogle();

  Future<Either<Failure, FirebaseUser>> registerWithFacebook();

  Future<Either<Failure, FirebaseUser>> registerWithTwitter();
}
