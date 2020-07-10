part of 'validation_bloc.dart';

@immutable
abstract class ValidationEvent extends Equatable {}

class ValidationLoadDataStarted extends ValidationEvent {
  @override
  List<Object> get props => [];
}
