import 'package:hiso/features/post/presentation/bloc/post_bloc.dart';
import 'package:hiso/injection_container.dart';

void initPost() {
  // Bloc
  dep.registerFactory(
    () => PostBloc(),
  );
}
