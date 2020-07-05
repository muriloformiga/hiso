import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:hiso/core/usecases/usecase.dart';

import 'package:hiso/features/auth/domain/usecases/login/login_with_facebook.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_google.dart';
import 'package:meta/meta.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_email.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required this.loginWithEmail,
    @required this.loginWithFacebook,
    @required this.loginWithGoogle,
  })  : assert(loginWithEmail != null),
        assert(loginWithFacebook != null),
        assert(loginWithGoogle != null),
        super(LoginInitial());

  final LoginWithEmail loginWithEmail;
  final LoginWithFacebook loginWithFacebook;
  final LoginWithGoogle loginWithGoogle;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginEmailStarted) {
      yield* _mapToSend(event);
    } else if (event is LoginFacebookStarted) {
      yield* _mapToFacebook();
    } else if (event is LoginGoogleStarted) {
      yield* _mapToGoogle();
    }
  }

  Stream<LoginState> _mapToSend(LoginEmailStarted event) async* {
    yield LoginLoadInProgress();

    final result = await loginWithEmail(
      Params(
        email: event.email,
        password: event.password,
      ),
    );
    yield* result.fold(
      (failure) async* {
        yield LoginFailure(message: failure.message);
      },
      (user) async* {
        yield LoginSuccess();
      },
    );
  }

  Stream<LoginState> _mapToGoogle() async* {
    yield LoginLoadInProgress();
    final result = await loginWithGoogle(NoParams());

    yield result.fold((failure) => LoginFailure(message: failure.message),
        (user) => LoginSuccess());
  }

  Stream<LoginState> _mapToFacebook() async* {
    yield LoginLoadInProgress();
    final result = await loginWithFacebook(NoParams());

    yield result.fold((failure) => LoginFailure(message: failure.message),
        (user) => LoginSuccess());
  }
}
