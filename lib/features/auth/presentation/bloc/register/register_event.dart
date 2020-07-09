part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEmailStarted extends RegisterEvent {
  RegisterEmailStarted({
    @required this.email,
    @required this.password,
    @required this.passwordRepeat,
  });

  final String email;
  final String password;
  final String passwordRepeat;

  @override
  List<Object> get props => [email, password, passwordRepeat];
}

class RegisterGoogleStarted extends RegisterEvent {}

class RegisterFacebookStarted extends RegisterEvent {}
