part of 'pacients_bloc.dart';

abstract class PacientsEvent extends Equatable {
  const PacientsEvent();

  @override
  List<Object> get props => [];
}

class PacientsGetMedicalPacients extends PacientsEvent {}
