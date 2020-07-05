import 'package:dartz/dartz.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/features/auth/domain/entities/auth_user.dart';

abstract class LoginRepository {
  Future<Either<Failure, AuthUser>> loginWithEmail(
    String email,
    String password,
  );

  Future<Either<Failure, AuthUser>> loginWithGoogle();

  Future<Either<Failure, AuthUser>> loginWithFacebook();
}
