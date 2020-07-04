import 'package:hiso/features/home/presentation/bloc/home_bloc.dart';
import 'package:hiso/injection_container.dart';

void initHome() {
  // Bloc
  dep.registerFactory(
    () => HomeBloc(
      logout: dep(),
    ),
  );
}
