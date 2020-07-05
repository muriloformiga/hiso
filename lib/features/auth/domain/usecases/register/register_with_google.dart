import 'package:hiso/features/auth/domain/entities/auth_user.dart';
import 'package:hiso/features/auth/domain/repositories/register_repository.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/core/usecases/usecase.dart';

class RegisterWithGoogle implements UseCase<AuthUser, NoParams> {
  RegisterWithGoogle(this.registerRepository);

  final RegisterRepository registerRepository;

  @override
  Future<Either<Failure, AuthUser>> call(params) async {
    return await registerRepository.registerWithGoogle();
  }
}
