import 'package:dartz/dartz.dart';
import 'package:hiso/core/error/failures.dart';

abstract class PostRepository {
  Future<Either<Failure, void>> registerPacient(
    String name,
    String lastName,
    String hospital,
  );
}
