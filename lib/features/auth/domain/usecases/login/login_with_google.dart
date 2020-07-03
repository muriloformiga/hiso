import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/features/auth/domain/repositories/login_repository.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/core/usecases/usecase.dart';

class LoginWithGoogle implements UseCase<FirebaseUser, NoParams> {
  LoginWithGoogle(this.loginRepository);

  final LoginRepository loginRepository;

  @override
  Future<Either<Failure, FirebaseUser>> call(params) async {
    return await loginRepository.loginWithGoogle();
  }
}
