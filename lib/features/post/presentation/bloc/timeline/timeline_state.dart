part of 'timeline_bloc.dart';

abstract class TimelineState extends Equatable {
  const TimelineState();

  @override
  List<Object> get props => [];
}

class TimelineInitial extends TimelineState {}

class TimelineDataLoading extends TimelineState {}

class TimelineGetPacientDataSucess extends TimelineState {
  TimelineGetPacientDataSucess({
    @required this.pacient,
  });

  final Pacient pacient;

  @override
  List<Object> get props => [pacient];
}

class TimelineGetPacientDataFailure extends TimelineState {
  TimelineGetPacientDataFailure({
    @required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
