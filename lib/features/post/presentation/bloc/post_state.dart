part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostPacientRegisterLoading extends PostState {}

class PostPacientRegisterError extends PostState {
  PostPacientRegisterError({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class PostPacientRegisterSucess extends PostState {}
