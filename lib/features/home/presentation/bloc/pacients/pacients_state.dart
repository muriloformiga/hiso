part of 'pacients_bloc.dart';

abstract class PacientsState extends Equatable {
  const PacientsState();

  @override
  List<Object> get props => [];
}

class PacientsInitial extends PacientsState {}

class PacientsLoadError extends PacientsState {
  PacientsLoadError({
    @required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

class PacientsLoadSucess extends PacientsState {
  final List<Pacient> pacients;
  final bool hasReachedMax;

  const PacientsLoadSucess({
    @required this.pacients,
    @required this.hasReachedMax,
  });

  PacientsLoadSucess copyWith({
    List<Pacient> pacients,
    bool hasReachedMax,
  }) {
    return PacientsLoadSucess(
      pacients: pacients ?? this.pacients,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [pacients, hasReachedMax];
}
