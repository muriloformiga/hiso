import 'package:hiso/features/post/data/datasources/post_datasource.dart';
import 'package:hiso/features/post/data/repositories/post_repository_impl.dart';
import 'package:hiso/features/post/domain/repositories/post_repository.dart';
import 'package:hiso/features/post/domain/usecases/register_pacient.dart';
import 'package:hiso/features/post/presentation/bloc/post_bloc.dart';
import 'package:hiso/injection_container.dart';

void initPost() {
  // Bloc
  dep.registerFactory(
    () => PostBloc(
      registerPacient: dep(),
    ),
  );

  // Use cases
  dep.registerLazySingleton(() => RegisterPacient(dep()));

  // Repository
  dep.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(
      postDataSource: dep(),
      networkInfo: dep(),
    ),
  );

  // Data sources
  dep.registerLazySingleton<PostDataSource>(
    () => PostDataSourceImpl(
      firestore: dep(),
    ),
  );
}
