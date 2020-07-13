part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeFailure extends HomeState {
  HomeFailure({@required this.message});

  final String message;
}

class HomeLogout extends HomeState {}

class HomeUserDataInexist extends HomeState {
  HomeUserDataInexist({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class HomeUserDataError extends HomeState {
  HomeUserDataError({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class HomeUserDataLoadSucess extends HomeState {}

class HomeDataLoadInProgress extends HomeState {}
