import 'package:equatable/equatable.dart';
import 'package:hiso/features/auth/domain/entities/auth_user.dart';
import 'package:hiso/features/auth/domain/repositories/register_repository.dart';
import 'package:meta/meta.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/core/usecases/usecase.dart';

class RegisterWithEmail implements UseCase<AuthUser, AuthParams> {
  RegisterWithEmail(this.registerRepository);

  final RegisterRepository registerRepository;

  @override
  Future<Either<Failure, AuthUser>> call(params) async {
    return await registerRepository.registerWithEmail(
      params.email,
      params.password,
    );
  }
}

class AuthParams extends Equatable {
  final String email;
  final String password;

  AuthParams({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
