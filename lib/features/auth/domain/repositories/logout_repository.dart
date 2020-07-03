import 'package:dartz/dartz.dart';
import 'package:hiso/core/error/failures.dart';

abstract class LogoutRepository {
  Future<Either<Failure, void>> logout();
}
