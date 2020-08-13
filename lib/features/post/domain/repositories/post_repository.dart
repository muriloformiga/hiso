import 'package:dartz/dartz.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/features/post/domain/entities/update.dart';

abstract class PostRepository {
  Future<Either<Failure, void>> registerPacient(
    String name,
    String lastName,
    String hospital,
    String healthNumber,
    String birthDate,
    String message,
  );

  Future<Either<Failure, List<Update>>> getPacientUpdates(
    String healthNumber,
  );
}
