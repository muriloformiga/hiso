part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {
  RegisterSuccess({@required this.authUser});

  final AuthUser authUser;

  @override
  List<Object> get props => [authUser];
}

class RegisterLoadInProgress extends RegisterState {}

class RegisterFailure extends RegisterState {
  RegisterFailure({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
