import 'package:dartz/dartz.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/features/home/domain/entities/pacient.dart';

abstract class PostRepository {
  Future<Either<Failure, void>> registerPacient(
    String name,
    String lastName,
    String hospital,
    String healthNumber,
    String birthDate,
    String message,
  );

  Future<Either<Failure, Pacient>> getPacientData(
    String healthNumber,
  );
}
