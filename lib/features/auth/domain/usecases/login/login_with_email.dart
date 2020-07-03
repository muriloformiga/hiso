import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/features/auth/domain/repositories/login_repository.dart';
import 'package:meta/meta.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/core/usecases/usecase.dart';

class LoginWithEmail implements UseCase<FirebaseUser, Params> {
  LoginWithEmail(this.loginRepository);

  final LoginRepository loginRepository;

  @override
  Future<Either<Failure, FirebaseUser>> call(params) async {
    return await loginRepository.loginWithEmail(
      params.email,
      params.password,
    );
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
