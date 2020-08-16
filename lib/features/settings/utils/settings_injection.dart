import 'package:hiso/features/settings/data/datasources/logout_datasource.dart';
import 'package:hiso/features/settings/data/repositories/logout_repository_impl.dart';
import 'package:hiso/features/settings/domain/repositories/logout_repository.dart';
import 'package:hiso/features/settings/domain/usecases/logout/logout.dart';
import 'package:hiso/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hiso/injection_container.dart';

void initSettings() {
  // Bloc
  dep.registerFactory(
    () => SettingsBloc(
      logout: dep(),
    ),
  );

  // Usecase
  dep.registerLazySingleton(() => Logout(dep()));

  // Repositories
  dep.registerLazySingleton<LogoutRepository>(
    () => LogoutRepositoryImpl(
      logoutDataSource: dep(),
    ),
  );

  // Data sources
  dep.registerLazySingleton<LogoutDataSource>(
    () => LogoutDataSourceImpl(
      firebaseAuth: dep(),
      googleSignIn: dep(),
      facebookLogin: dep(),
    ),
  );
}
