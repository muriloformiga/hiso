import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:hiso/features/auth/domain/usecases/register/register_with_email.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    @required this.registerWithEmail,
  })  : assert(registerWithEmail != null),
        super(RegisterInitial());

  final RegisterWithEmail registerWithEmail;

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterEmailStarted) {
      yield* _mapToEmailStarted(event);
    }
  }

  Stream<RegisterState> _mapToEmailStarted(RegisterEmailStarted event) async* {
    if (event.password.length < 6) {
      yield RegisterFailure(message: 'A senha deve ter no mínimo 6 caracteres');
      return;
    }
    if (event.password != event.passwordRepeat) {
      yield RegisterFailure(message: 'Primeira senha diferente da segunda');
      return;
    }
    yield RegisterLoadInProgress();
    final result = await registerWithEmail(
      Params(
        email: event.email,
        password: event.password,
      ),
    );
    yield result.fold(
      (failure) => RegisterFailure(message: failure.message),
      (user) => RegisterSuccess(userId: user.firebaseUser.uid),
    );
  }
}
