import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/auth/domain/repositories/logout_repository.dart';

class Logout implements UseCase<void, NoParams> {
  Logout(this.logoutRepository);

  final LogoutRepository logoutRepository;

  @override
  Future<Either<Failure, void>> call(params) async {
    return await logoutRepository.logout();
  }
}
