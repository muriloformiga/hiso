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
    );
  }
}

class Params extends Equatable {
  Params({
    @required this.name,
    @required this.lastName,
    @required this.hospital,
  });

  final String name;
  final String lastName;
  final String hospital;

  @override
  List<Object> get props => [
        name,
        lastName,
        hospital,
      ];
}
