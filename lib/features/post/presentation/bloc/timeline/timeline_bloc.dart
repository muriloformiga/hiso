import 'package:bloc/bloc.dart';
import 'package:hiso/core/utils/app_consts.dart';
import 'package:hiso/features/post/domain/entities/update.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:hiso/features/post/domain/usecases/get_pacient_updates.dart';

part 'timeline_event.dart';
part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineBloc({
    @required this.getPacientUpdates,
  }) : super(TimelineInitial());

  final GetPacientUpdates getPacientUpdates;

  @override
  Stream<TimelineState> mapEventToState(TimelineEvent event) async* {
    if (event is TimelineGetPacientUpdates && !_hasReachedMax(state)) {
      yield* _mapToGetPacientData(event);
    }
  }

  Stream<TimelineState> _mapToGetPacientData(
    TimelineGetPacientUpdates event,
  ) async* {
    if (state is TimelineInitial) {
      final result = await getPacientUpdates(
        Params(healthNumber: event.healthNumber),
      );
      yield result.fold(
        (failure) => TimelineGetUpdatesError(message: failure.message),
        (updates) {
          return TimelineGetUpdatesSucess(
            updates: updates,
            hasReachedMax: updates.length < AppConsts.paginationValue,
          );
        },
      );
    }
    if (state is TimelineGetUpdatesSucess) {
      final result = await getPacientUpdates(
        Params(healthNumber: event.healthNumber),
      );
      yield result.fold(
        (failure) => TimelineGetUpdatesError(message: failure.message),
        (updates) {
          return updates.length < AppConsts.paginationValue
              ? (state as TimelineGetUpdatesSucess)
                  .copyWith(hasReachedMax: true)
              : TimelineGetUpdatesSucess(
                  updates:
                      (state as TimelineGetUpdatesSucess).updates + updates,
                  hasReachedMax: updates.length < AppConsts.paginationValue,
                );
        },
      );
    }
  }

  bool _hasReachedMax(TimelineState state) =>
      state is TimelineGetUpdatesSucess && state.hasReachedMax;
}
