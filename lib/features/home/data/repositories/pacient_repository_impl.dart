import 'package:dartz/dartz.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/info/network_info.dart';
import 'package:hiso/features/home/data/datasources/pacient_datasource.dart';
import 'package:meta/meta.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/features/post/domain/entities/pacient.dart';
import 'package:hiso/features/home/domain/repositories/pacient_repository.dart';

class PacientRepositoryImpl implements PacientRepository {
  PacientRepositoryImpl({
    @required this.pacientDataSource,
    @required this.networkInfo,
  });

  final PacientDataSource pacientDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<Pacient>>> getMedicalPacients() async {
    if (await networkInfo.isConnected) {
      try {
        final pacients = await pacientDataSource.getMedicalPacients();
        return Right(pacients);
      } on FirestoreException catch (_) {
        return Left(FirestoreFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
