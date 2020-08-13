part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterLoadInProgress extends RegisterState {}

class RegisterButtom extends RegisterState {
  RegisterButtom({this.estado = false});

  final bool estado;

  @override
  List<Object> get props => [estado];
}

class RegisterFailure extends RegisterState {
  RegisterFailure({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
