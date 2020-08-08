part of 'pacients_bloc.dart';

abstract class PacientsState extends Equatable {
  const PacientsState();

  @override
  List<Object> get props => [];
}

class PacientsInitial extends PacientsState {}

class PacientsMedicalPacientsLoading extends PacientsState {}

class PacientsMedicalPacientsLoadError extends PacientsState {
  PacientsMedicalPacientsLoadError({
    @required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

class PacientsMedicalPacientsLoadSucess extends PacientsState {
  PacientsMedicalPacientsLoadSucess({
    @required this.pacients,
  });

  final List<Pacient> pacients;

  @override
  List<Object> get props => [pacients];
}
