import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hiso/core/network/network_info.dart';
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
import 'package:hiso/features/auth/presentation/bloc/login_bloc.dart';

// Service Locator (Dependency)
final dep = GetIt.instance;

void init() {
  //! Features - Auth
  // Bloc
  dep.registerFactory(
    () => LoginBloc(
      loginWithEmail: dep(),
      loginWithFacebook: dep(),
      loginWithGoogle: dep(),
      loginWithTwitter: dep(),
      logout: dep(),
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
      facebookLogin: dep(),
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

  //! Core
  dep.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dep()));

  //! External
  dep.registerLazySingleton(() => FirebaseAuth.instance);
  dep.registerLazySingleton(() => GoogleSignIn());
  dep.registerLazySingleton(() => FacebookLogin());
  dep.registerLazySingleton(() => DataConnectionChecker());
}
