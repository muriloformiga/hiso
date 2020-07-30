import 'package:hiso/core/error/exceptions.dart';
import 'package:hiso/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hiso/core/info/network_info.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:hiso/features/post/data/datasources/post_datasource.dart';
import 'package:meta/meta.dart';
import 'package:hiso/features/post/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({
    @required this.postDataSource,
    @required this.networkInfo,
  });

  final PostDataSource postDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, void>> registerPacient(
    String name,
    String lastName,
    String hospital,
    String healthNumber,
    String birthDate,
    String message,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final data = <String, dynamic>{
          'creatorId': User.instance.userId,
          'creatorName': User.instance.name,
          'creatorCode': User.instance.code,
          'name': name,
          'lastName': lastName,
          'hospital': hospital,
          'birthDate': birthDate,
          'updates': <String, dynamic>{
            'message': message,
            'date': DateTime.now(),
          },
        };
        final result = await postDataSource.registerPacient(healthNumber, data);
        return Right(result);
      } on FirestorePacientAlreadyExistsException {
        return Left(FirestorePacientAlreadyExistsFailure());
      } catch (_) {
        return Left(FirestoreFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
