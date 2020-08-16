import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hiso/features/settings/domain/usecases/logout/logout.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:hiso/core/usecases/usecase.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    @required this.logout,
  })  : assert(logout != null),
        super(SettingsInitial());

  final Logout logout;

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsLogoutStarted) {
      yield* _mapToLogout();
    }
  }

  Stream<SettingsState> _mapToLogout() async* {
    final result = await logout(NoParams());
    yield result.fold(
      (failure) => SettingsFailure(message: failure.message),
      (_) => SettingsLogout(),
    );
  }
}
