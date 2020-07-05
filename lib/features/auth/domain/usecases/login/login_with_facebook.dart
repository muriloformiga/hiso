import 'package:hiso/features/auth/domain/entities/auth_user.dart';
import 'package:hiso/features/auth/domain/repositories/login_repository.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/core/usecases/usecase.dart';

class LoginWithFacebook implements UseCase<AuthUser, NoParams> {
  LoginWithFacebook(this.loginRepository);

  final LoginRepository loginRepository;

  @override
  Future<Either<Failure, AuthUser>> call(params) async {
    return await loginRepository.loginWithFacebook();
  }
}
