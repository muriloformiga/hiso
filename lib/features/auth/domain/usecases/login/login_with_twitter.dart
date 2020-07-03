import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/features/auth/domain/repositories/login_repository.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/core/usecases/usecase.dart';

class LoginWithTwitter implements UseCase<FirebaseUser, NoParams> {
  LoginWithTwitter(this.loginRepository);

  final LoginRepository loginRepository;

  @override
  Future<Either<Failure, FirebaseUser>> call(params) async {
    return await loginRepository.loginWithTwitter();
  }
}
