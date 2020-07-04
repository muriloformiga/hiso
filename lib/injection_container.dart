import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hiso/core/info/auth_info.dart';
import 'package:hiso/core/info/network_info.dart';
import 'package:hiso/features/auth/utils/auth_injection.dart';
import 'package:hiso/features/home/utils/home_injection.dart';

// Service Locator (Dependency)
final dep = GetIt.instance;

void init() {
  //! Features
  //! Auth
  initAuth();
  //! Home
  initHome();

  //! Core
  dep.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(dep()));
  dep.registerLazySingleton<FirebaseInfo>(() => FirebaseInfoImpl(dep()));

  //! External
  dep.registerLazySingleton(() => FirebaseAuth.instance);
  dep.registerLazySingleton(() => GoogleSignIn());
  dep.registerLazySingleton(() => DataConnectionChecker());
}
