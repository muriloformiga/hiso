import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:hiso/features/post/domain/usecases/register_pacient.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({
    @required this.registerPacient,
  }) : super(PostInitial());

  final RegisterPacient registerPacient;

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is PostPacientRegisterStarted) {
      yield* _mapToPacientRegisterStarted(event);
    }
  }

  Stream<PostState> _mapToPacientRegisterStarted(
    PostPacientRegisterStarted event,
  ) async* {
    yield PostPacientRegisterLoading();
    final result = await registerPacient(
      Params(
        name: event.name,
        lastName: event.lastName,
        hospital: event.hospital,
      ),
    );
    yield result.fold(
      (failure) => PostPacientRegisterError(),
      (_) => PostPacientRegisterSucess(),
    );
  }
}
