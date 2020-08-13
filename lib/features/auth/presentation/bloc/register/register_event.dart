part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEmailStarted extends RegisterEvent {
  RegisterEmailStarted({
    @required this.email,
    @required this.password,
    @required this.passwordRepeat,
    @required this.name,
    @required this.accountType,
    @required this.phone,
  });

  final String email;
  final String password;
  final String passwordRepeat;
  final String name;
  final String accountType;
  final String phone;

  @override
  List<Object> get props => [
        email,
        password,
        passwordRepeat,
        name,
        accountType,
        phone,
      ];
}

class RegisterGoogleStarted extends RegisterEvent {}

class RegisterFacebookStarted extends RegisterEvent {}

class RegisterButtomPressed extends RegisterEvent {
  RegisterButtomPressed({
    this.estado = true,
  });

  final bool estado;

  @override
  List<Object> get props => [estado];
}
