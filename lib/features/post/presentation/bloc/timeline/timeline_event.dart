part of 'timeline_bloc.dart';

abstract class TimelineEvent extends Equatable {
  const TimelineEvent();
}

class TimelineGetPacientData extends TimelineEvent {
  TimelineGetPacientData({
    @required this.healthNumber,
  });

  final String healthNumber;

  @override
  List<Object> get props => [healthNumber];
}
