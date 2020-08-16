part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeUserDataInexist extends HomeState {
  HomeUserDataInexist({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class HomeUserDataLoadError extends HomeState {
  HomeUserDataLoadError({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class HomeUserDataLoadSucess extends HomeState {}

class HomeUserDataLoading extends HomeState {}
