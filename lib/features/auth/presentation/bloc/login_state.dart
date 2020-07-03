part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  LoginSuccess({@required this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}

class LoginLoadInProgress extends LoginState {}

class LoginFailure extends LoginState {
  LoginFailure({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
