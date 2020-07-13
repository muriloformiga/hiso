part of 'validation_bloc.dart';

@immutable
abstract class ValidationState extends Equatable {
  @override
  List<Object> get props => [];
}

class ValidationInitial extends ValidationState {}

class ValidationLoadDataInProgress extends ValidationState {}

class ValidationDataEmpty extends ValidationState {}

class ValidationSucess extends ValidationState {
  ValidationSucess({@required this.userData});

  final UserData userData;

  @override
  List<Object> get props => [userData];
}

class ValidationFailure extends ValidationState {
  ValidationFailure({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
