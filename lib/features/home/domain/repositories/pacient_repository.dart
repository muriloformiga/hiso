import 'package:dartz/dartz.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/features/home/domain/entities/pacient.dart';

abstract class PacientRepository {
  Future<Either<Failure, List<Pacient>>> getMedicalPacients();
}
