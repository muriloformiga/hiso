import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/features/auth/domain/repositories/register_repository.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/core/usecases/usecase.dart';

class RegisterWithGoogle implements UseCase<FirebaseUser, NoParams> {
  RegisterWithGoogle(this.registerRepository);

  final RegisterRepository registerRepository;

  @override
  Future<Either<Failure, FirebaseUser>> call(params) async {
    return await registerRepository.registerWithGoogle();
  }
}
