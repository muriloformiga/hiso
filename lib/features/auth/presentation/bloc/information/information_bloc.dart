import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'information_event.dart';
part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  InformationBloc() : super(InformationInitial());

  @override
  Stream<InformationState> mapEventToState(
    InformationEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
