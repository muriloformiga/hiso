part of 'timeline_bloc.dart';

abstract class TimelineState extends Equatable {
  const TimelineState();

  @override
  List<Object> get props => [];
}

class TimelineInitial extends TimelineState {}

class TimelineGetUpdatesSucess extends TimelineState {
  final List<Update> updates;
  final bool hasReachedMax;

  TimelineGetUpdatesSucess({
    @required this.updates,
    @required this.hasReachedMax,
  });

  TimelineGetUpdatesSucess copyWith({
    List<Update> updates,
    bool hasReachedMax,
  }) {
    return TimelineGetUpdatesSucess(
      updates: updates ?? this.updates,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [updates, hasReachedMax];
}

class TimelineGetUpdatesError extends TimelineState {
  TimelineGetUpdatesError({
    @required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
