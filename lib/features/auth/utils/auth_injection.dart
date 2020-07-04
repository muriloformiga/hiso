import 'package:hiso/features/auth/data/datasources/login_datasource.dart';
import 'package:hiso/features/auth/data/datasources/logout_datasource.dart';
import 'package:hiso/features/auth/data/datasources/register_datasource.dart';
import 'package:hiso/features/auth/data/repositories/login_repository_impl.dart';
import 'package:hiso/features/auth/data/repositories/logout_repository_impl.dart';
import 'package:hiso/features/auth/data/repositories/register_repository_impl.dart';
import 'package:hiso/features/auth/domain/repositories/login_repository.dart';
import 'package:hiso/features/auth/domain/repositories/logout_repository.dart';
import 'package:hiso/features/auth/domain/repositories/register_repository.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_email.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_facebook.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_google.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_twitter.dart';
import 'package:hiso/features/auth/domain/usecases/logout/logout.dart';
import 'package:hiso/features/auth/domain/usecases/register/register_with_email.dart';
import 'package:hiso/features/auth/domain/usecases/register/register_with_facebook.dart';
import 'package:hiso/features/auth/domain/usecases/register/register_with_google.dart';
import 'package:hiso/features/auth/domain/usecases/register/register_with_twitter.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator_impl.dart';
import 'package:hiso/injection_container.dart';

void initAuth() {
  // Bloc
  dep.registerFactory(
    () => LoginBloc(
      loginWithEmail: dep(),
      loginWithFacebook: dep(),
      loginWithGoogle: dep(),
      loginWithTwitter: dep(),
    ),
  );

  // Coordinator
  dep.registerFactory(
    () => AuthCoordinatorImpl(
      firebaseInfo: dep(),
    ),
  );

  // Use cases
  dep.registerLazySingleton(() => LoginWithEmail(dep()));
  dep.registerLazySingleton(() => LoginWithFacebook(dep()));
  dep.registerLazySingleton(() => LoginWithGoogle(dep()));
  dep.registerLazySingleton(() => LoginWithTwitter(dep()));

  dep.registerLazySingleton(() => RegisterWithEmail(dep()));
  dep.registerLazySingleton(() => RegisterWithFacebook(dep()));
  dep.registerLazySingleton(() => RegisterWithGoogle(dep()));
  dep.registerLazySingleton(() => RegisterWithTwitter(dep()));

  dep.registerLazySingleton(() => Logout(dep()));

  // Repository
  dep.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      loginDataSource: dep(),
      networkInfo: dep(),
    ),
  );
  dep.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(
      registerDataSource: dep(),
      networkInfo: dep(),
    ),
  );
  dep.registerLazySingleton<LogoutRepository>(
    () => LogoutRepositoryImpl(
      logoutDataSource: dep(),
    ),
  );

  // Data sources
  dep.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(
      firebaseAuth: dep(),
      googleSignIn: dep(),
    ),
  );
  dep.registerLazySingleton<RegisterDataSource>(
    () => RegisterDataSourceImpl(firebaseAuth: dep()),
  );
  dep.registerLazySingleton<LogoutDataSource>(
    () => LogoutDataSourceImpl(
      firebaseAuth: dep(),
      googleSignIn: dep(),
    ),
  );
}
