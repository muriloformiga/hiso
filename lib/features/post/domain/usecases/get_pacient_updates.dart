import 'package:equatable/equatable.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/features/post/domain/entities/update.dart';
import 'package:hiso/features/post/domain/repositories/post_repository.dart';
import 'package:meta/meta.dart';
import 'package:hiso/core/usecases/usecase.dart';

class GetPacientUpdates implements UseCase<List<Update>, Params> {
  GetPacientUpdates(this.postRepository);

  final PostRepository postRepository;

  @override
  Future<Either<Failure, List<Update>>> call(Params params) async {
    return await postRepository.getPacientUpdates(
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
