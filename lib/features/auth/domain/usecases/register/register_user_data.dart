import 'package:equatable/equatable.dart';
import 'package:hiso/features/auth/domain/repositories/register_repository.dart';
import 'package:meta/meta.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/core/usecases/usecase.dart';

class RegisterUserData implements UseCase<void, DataParams> {
  RegisterUserData(this.registerRepository);

  final RegisterRepository registerRepository;

  @override
  Future<Either<Failure, void>> call(params) async {
    return await registerRepository.registerUserData(
      params.name,
      params.accountType,
      params.phone,
    );
  }
}

class DataParams extends Equatable {
  final String name;
  final String accountType;
  final String phone;

  DataParams({
    @required this.name,
    @required this.accountType,
    @required this.phone,
  });

  @override
  List<Object> get props => [
        name,
        accountType,
        phone,
      ];
}
