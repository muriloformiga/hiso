import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/info/network_info.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/features/auth/domain/entities/user_data.dart';
import 'package:meta/meta.dart';
import 'package:hiso/features/auth/data/datasources/validation_datasource.dart';
import 'package:hiso/features/auth/domain/repositories/validation_repository.dart';

class ValidationRepositoryImpl implements ValidationRepository {
  ValidationRepositoryImpl({
    @required this.validationDataSource,
    @required this.networkInfo,
  });

  final ValidationDataSource validationDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, UserData>> getUserData() async {
    if (await networkInfo.isConnected) {
      try {
        final user = await validationDataSource.getUserData();
        return Right(user);
      } on FirestoreException catch (_) {
        return Left(FirestoreFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
