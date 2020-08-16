part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLogout extends SettingsState {}

class SettingsFailure extends SettingsState {
  SettingsFailure({
    @required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
