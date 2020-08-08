import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hiso/core/usecases/usecase.dart';
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
    if (event is PacientsGetMedicalPacients) {
      yield* _mapToGetMedicalPacients();
    }
  }

  Stream<PacientsState> _mapToGetMedicalPacients() async* {
    yield PacientsMedicalPacientsLoading();
    final result = await getMedicalPacients(NoParams());
    yield result.fold(
      (failure) => PacientsMedicalPacientsLoadError(message: failure.message),
      (pacients) => PacientsMedicalPacientsLoadSucess(pacients: pacients),
    );
  }
}
