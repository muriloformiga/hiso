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
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final data = <String, dynamic>{
          'creatorId': User.instance.userId,
          'creatorName': User.instance.name,
          'name': name,
          'lastName': lastName,
          'hospital': hospital,
        };
        final result = await postDataSource.registerPacient(data);
        return Right(result);
      } on FirestoreException catch (_) {
        return Left(FirestoreFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
