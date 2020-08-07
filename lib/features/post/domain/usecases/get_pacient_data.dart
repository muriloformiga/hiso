import 'package:equatable/equatable.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/features/post/domain/repositories/post_repository.dart';
import 'package:meta/meta.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/home/domain/entities/pacient.dart';

class GetPacientData implements UseCase<Pacient, Params> {
  GetPacientData(this.postRepository);

  final PostRepository postRepository;

  @override
  Future<Either<Failure, Pacient>> call(Params params) async {
    return await postRepository.getPacientData(
      params.healthNumber,
    );
  }
}

class Params extends Equatable {
  Params({
    @required this.healthNumber,
  });

  final String healthNumber;

  @override
  List<Object> get props => [healthNumber];
}
