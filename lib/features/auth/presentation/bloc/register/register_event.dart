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
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class RegisterGoogleStarted extends RegisterEvent {}
