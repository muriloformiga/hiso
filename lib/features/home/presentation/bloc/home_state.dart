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
