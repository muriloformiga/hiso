import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:hiso/core/usecases/usecase.dart';

import 'package:hiso/features/auth/domain/usecases/login/login_with_facebook.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_google.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_twitter.dart';
import 'package:hiso/features/auth/domain/usecases/logout/logout.dart';
import 'package:meta/meta.dart';
import 'package:hiso/features/auth/domain/usecases/login/login_with_email.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required this.loginWithEmail,
    @required this.loginWithFacebook,
    @required this.loginWithGoogle,
    @required this.loginWithTwitter,
  })  : assert(loginWithEmail != null),
        assert(loginWithFacebook != null),
        assert(loginWithGoogle != null),
        assert(loginWithTwitter != null);

  final LoginWithEmail loginWithEmail;
  final LoginWithFacebook loginWithFacebook;
  final LoginWithGoogle loginWithGoogle;
  final LoginWithTwitter loginWithTwitter;

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginEmailStarted) {
      yield* _mapToSend(event);
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
        yield LoginSuccess(userId: user.uid);
      },
    );
  }

  Stream<LoginState> _mapToGoogle() async* {
    final result = await loginWithGoogle(NoParams());

    yield result.fold((failure) => LoginFailure(message: failure.message),
        (user) => LoginSuccess(userId: user.uid));
  }
}
