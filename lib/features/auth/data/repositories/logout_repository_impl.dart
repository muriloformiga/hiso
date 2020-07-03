import 'package:dartz/dartz.dart';
import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/features/auth/data/datasources/logout_datasource.dart';
import 'package:meta/meta.dart';
import 'package:hiso/features/auth/domain/repositories/logout_repository.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  LogoutRepositoryImpl({@required this.logoutDataSource});

  final LogoutDataSource logoutDataSource;

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final logout = await logoutDataSource.logout();
      return Right(logout);
    } on FirebaseLogoutException {
      return Left(FirebaseLogoutFailure());
    }
  }
}
