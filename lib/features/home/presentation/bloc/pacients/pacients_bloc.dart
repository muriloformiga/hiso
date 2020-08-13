import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/core/utils/app_consts.dart';
import 'package:hiso/features/home/domain/usecases/home/get_medical_pacients.dart';
import 'package:hiso/features/post/domain/entities/pacient.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'pacients_event.dart';
part 'pacients_state.dart';

class PacientsBloc extends Bloc<PacientsEvent, PacientsState> {
  PacientsBloc({
    @required this.getMedicalPacients,
  })  : assert(getMedicalPacients != null),
        super(PacientsInitial());

  final GetMedicalPacients getMedicalPacients;

  @override
  Stream<PacientsState> mapEventToState(
    PacientsEvent event,
  ) async* {
    if (event is PacientsGetMedicalPacients && !_hasReachedMax(state)) {
      yield* _mapToGetMedicalPacients();
    }
  }

  Stream<PacientsState> _mapToGetMedicalPacients() async* {
    if (state is PacientsInitial) {
      final result = await getMedicalPacients(NoParams());
      yield result.fold(
        (failure) => PacientsLoadError(message: failure.message),
        (pacients) => PacientsLoadSucess(
          pacients: pacients,
          hasReachedMax: pacients.length < AppConsts.paginationValue,
        ),
      );
    }
    if (state is PacientsLoadSucess) {
      final result = await getMedicalPacients(NoParams());
      yield result.fold(
        (failure) => PacientsLoadError(message: failure.message),
        (pacients) {
          return pacients.length < AppConsts.paginationValue
              ? (state as PacientsLoadSucess).copyWith(hasReachedMax: true)
              : PacientsLoadSucess(
                  pacients: (state as PacientsLoadSucess).pacients + pacients,
                  hasReachedMax: pacients.length < AppConsts.paginationValue,
                );
        },
      );
    }
  }

  bool _hasReachedMax(PacientsState state) =>
      state is PacientsLoadSucess && state.hasReachedMax;
}
