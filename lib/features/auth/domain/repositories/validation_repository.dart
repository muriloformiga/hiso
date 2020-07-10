import 'package:dartz/dartz.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:hiso/features/auth/domain/entities/user_data.dart';

abstract class ValidationRepository {
  Future<Either<Failure, UserData>> getUserData();
}
