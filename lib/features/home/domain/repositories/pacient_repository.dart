import 'package:dartz/dartz.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/features/post/domain/entities/pacient.dart';

abstract class PacientRepository {
  Future<Either<Failure, List<Pacient>>> getMedicalPacients();
}
