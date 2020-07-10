import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/auth/domain/entities/user_data.dart';
import 'package:hiso/features/auth/domain/repositories/validation_repository.dart';

class GetUserData implements UseCase<UserData, NoParams> {
  GetUserData(this.validationRepository);

  final ValidationRepository validationRepository;

  @override
  Future<Either<Failure, UserData>> call(params) async {
    return await validationRepository.getUserData();
  }
}
