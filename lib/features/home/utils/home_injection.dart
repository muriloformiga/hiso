import 'package:hiso/features/home/domain/usecases/validation/get_user_data.dart';
import 'package:hiso/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:hiso/features/home/presentation/bloc/validation/validation_bloc.dart';
import 'package:hiso/injection_container.dart';

void initHome() {
  // Bloc
  dep.registerFactory(
    () => HomeBloc(
      logout: dep(),
      getUserData: dep(),
    ),
  );
  dep.registerFactory(
    () => ValidationBloc(
      getUserData: dep(),
    ),
  );

  // Usecase
  dep.registerLazySingleton(() => GetUserData(dep()));
}
