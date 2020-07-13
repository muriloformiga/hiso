import 'package:hiso/features/auth/data/datasources/login_datasource.dart';
import 'package:hiso/features/auth/data/datasources/logout_datasource.dart';
import 'package:hiso/features/auth/data/datasources/register_datasource.dart';
import 'package:hiso/features/home/data/datasources/validation_datasource.dart';
import 'package:hiso/features/auth/data/repositories/login_repository_impl.dart';
import 'package:hiso/features/auth/data/repositories/logout_repository_impl.dart';
import 'package:hiso/features/auth/data/repositories/register_repository_impl.dart';
import 'package:hiso/features/home/data/repositories/validation_repository_impl.dart';
import 'package:hiso/features/auth/domain/repositories/login_repository.dart';
import 'package:hiso/features/auth/domain/repositories/logout_repository.dart';
import 'package:hiso/features/auth/domain/repositories/register_repository.dart';
import 'package:hiso/features/home/domain/repositories/validation_repository.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_email.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_facebook.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_google.dart';
import 'package:hiso/features/auth/domain/usecases/logout/logout.dart';
import 'package:hiso/features/auth/domain/usecases/register/register_user_data.dart';
import 'package:hiso/features/auth/domain/usecases/register/register_with_email.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator_impl.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hiso/injection_container.dart';

void initAuth() {
  // Bloc
  dep.registerFactory(
    () => LoginBloc(
      loginWithEmail: dep(),
      loginWithFacebook: dep(),
      loginWithGoogle: dep(),
    ),
  );
  dep.registerFactory(
    () => RegisterBloc(
      registerWithEmail: dep(),
      registerUserData: dep(),
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

  dep.registerLazySingleton(() => RegisterWithEmail(dep()));

  dep.registerLazySingleton(() => Logout(dep()));

  dep.registerLazySingleton(() => RegisterUserData(dep()));

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
  dep.registerLazySingleton<ValidationRepository>(
    () => ValidationRepositoryImpl(
      validationDataSource: dep(),
      networkInfo: dep(),
    ),
  );

  // Data sources
  dep.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(
      firebaseAuth: dep(),
      googleSignIn: dep(),
      facebookLogin: dep(),
    ),
  );
  dep.registerLazySingleton<RegisterDataSource>(
    () => RegisterDataSourceImpl(
      firebaseAuth: dep(),
      firestore: dep(),
    ),
  );
  dep.registerLazySingleton<LogoutDataSource>(
    () => LogoutDataSourceImpl(
      firebaseAuth: dep(),
      googleSignIn: dep(),
      facebookLogin: dep(),
    ),
  );
  dep.registerLazySingleton<ValidationDataSource>(
    () => ValidationDataSourceImpl(
      firestore: dep(),
    ),
  );
}
