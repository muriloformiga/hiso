import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:hiso/core/utils/mask.dart';
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
    final error = await _validatePost(event);
    if (error.isNotEmpty) {
      yield PostPacientRegisterError(message: error);
      return;
    }
    final result = await registerPacient(
      Params(
        name: event.name,
        lastName: event.lastName,
        hospital: event.hospital,
        healthNumber: event.healthNumber,
        birthDate: event.birthDate,
        message: event.message,
      ),
    );
    yield result.fold(
      (failure) => PostPacientRegisterError(message: failure.message),
      (_) => PostPacientRegisterSucess(),
    );
  }

  Future<String> _validatePost(PostPacientRegisterStarted event) async {
    final hasEmptyField = event.name.isEmpty ||
        event.lastName.isEmpty ||
        event.hospital.isEmpty ||
        event.healthNumber.isEmpty ||
        event.birthDate.isEmpty ||
        event.message.isEmpty;
    if (hasEmptyField) {
      return 'Todos os campos devem ser preenchidos.';
    }
    if (!event.healthNumber.isHealthNumberValid) {
      return 'O número do SUS digitado não é válido.';
    }
    if (!event.birthDate.isDateValid) {
      return 'A data de nascimento digitada não é válida.';
    }
    return '';
  }
}
