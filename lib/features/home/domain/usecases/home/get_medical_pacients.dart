import 'package:dartz/dartz.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/features/home/domain/repositories/pacient_repository.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/home/domain/entities/pacient.dart';

class GetMedicalPacients implements UseCase<List<Pacient>, NoParams> {
  GetMedicalPacients(this.pacientRepository);

  final PacientRepository pacientRepository;

  @override
  Future<Either<Failure, List<Pacient>>> call(params) async {
    return await pacientRepository.getMedicalPacients();
  }
}

// class Params extends Equatable {
//   Params({
//     this.fullName,
//     this.birthDate,
//   });

//   final String fullName;
//   final DateTime birthDate;

//   @override
//   List<Object> get props => [
//         fullName,
//         birthDate,
//       ];
// }
