import 'package:hiso/features/home/coordinator/home_coordinator_impl.dart';
import 'package:hiso/features/home/data/datasources/pacient_datasource.dart';
import 'package:hiso/features/home/data/datasources/validation_datasource.dart';
import 'package:hiso/features/home/data/repositories/pacient_repository_impl.dart';
import 'package:hiso/features/home/data/repositories/validation_repository_impl.dart';
import 'package:hiso/features/home/domain/repositories/pacient_repository.dart';
import 'package:hiso/features/home/domain/repositories/validation_repository.dart';
import 'package:hiso/features/home/domain/usecases/home/get_medical_pacients.dart';
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
      getMedicalPacients: dep(),
    ),
  );
  dep.registerFactory(
    () => ValidationBloc(
      getUserData: dep(),
    ),
  );

  // Coordinator
  dep.registerFactory(
    () => HomeCoordinatorImpl(),
  );

  // Usecase
  dep.registerLazySingleton(() => GetUserData(dep()));
  dep.registerLazySingleton(() => GetMedicalPacients(dep()));

  // Repositories
  dep.registerLazySingleton<ValidationRepository>(
    () => ValidationRepositoryImpl(
      validationDataSource: dep(),
      networkInfo: dep(),
    ),
  );
  dep.registerLazySingleton<PacientRepository>(
    () => PacientRepositoryImpl(
      pacientDataSource: dep(),
      networkInfo: dep(),
    ),
  );

  // Data sources
  dep.registerLazySingleton<ValidationDataSource>(
    () => ValidationDataSourceImpl(
      firestore: dep(),
    ),
  );
  dep.registerLazySingleton<PacientDataSource>(
    () => PacientDataSourceImpl(
      firestore: dep(),
    ),
  );
}
