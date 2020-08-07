import 'package:bloc/bloc.dart';
import 'package:hiso/features/home/domain/entities/pacient.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:hiso/features/post/domain/usecases/get_pacient_data.dart';

part 'timeline_event.dart';
part 'timeline_state.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineBloc({
    @required this.getPacientData,
  }) : super(TimelineInitial());

  final GetPacientData getPacientData;

  @override
  Stream<TimelineState> mapEventToState(TimelineEvent event) async* {
    if (event is TimelineGetPacientData) {
      yield* _mapToGetPacientData(event);
    }
  }

  Stream<TimelineState> _mapToGetPacientData(
    TimelineGetPacientData event,
  ) async* {
    yield TimelineDataLoading();
    final result = await getPacientData(
      Params(healthNumber: event.healthNumber),
    );
    yield result.fold(
      (failure) => TimelineGetPacientDataFailure(message: failure.message),
      (pacient) => TimelineGetPacientDataSucess(pacient: pacient),
    );
  }
}
