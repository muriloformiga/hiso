import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hiso/core/usecases/usecase.dart';
import 'package:hiso/features/auth/domain/usecases/logout/logout.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @required this.logout,
  })  : assert(logout != null),
        super(HomeInitial());

  final Logout logout;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeLogoutStarted) {
      yield* _mapToLogout();
    }
  }

  Stream<HomeState> _mapToLogout() async* {
    final result = await logout(NoParams());

    yield result.fold((failure) => HomeFailure(message: failure.message),
        (_) => HomeLogout());
  }
}
