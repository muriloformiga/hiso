import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/features/post/domain/repositories/post_repository.dart';
import 'package:meta/meta.dart';
import 'package:hiso/core/usecases/usecase.dart';

class RegisterPacient implements UseCase<void, Params> {
  RegisterPacient(this.postRepository);

  final PostRepository postRepository;

  @override
  Future<Either<Failure, void>> call(params) async {
    return await postRepository.registerPacient(
      params.name,
      params.lastName,
      params.hospital,
      params.healthNumber,
      params.birthDate,
      params.message,
    );
  }
}

class Params extends Equatable {
  Params({
    @required this.name,
    @required this.lastName,
    @required this.hospital,
    @required this.healthNumber,
    @required this.birthDate,
    @required this.message,
  });

  final String name;
  final String lastName;
  final String hospital;
  final String healthNumber;
  final String birthDate;
  final String message;

  @override
  List<Object> get props => [
        name,
        lastName,
        hospital,
        healthNumber,
        birthDate,
        message,
      ];
}
