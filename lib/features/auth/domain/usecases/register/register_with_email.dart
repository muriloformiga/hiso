import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/features/auth/domain/repositories/register_repository.dart';
import 'package:meta/meta.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/core/usecases/usecase.dart';

class RegisterWithEmail implements UseCase<FirebaseUser, Params> {
  RegisterWithEmail(this.registerRepository);

  final RegisterRepository registerRepository;

  @override
  Future<Either<Failure, FirebaseUser>> call(params) async {
    return await registerRepository.registerWithEmail(
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
