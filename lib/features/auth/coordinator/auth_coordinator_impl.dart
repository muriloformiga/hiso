import 'package:flutter/material.dart';
import 'package:hiso/core/info/auth_info.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/auth/coordinator/auth_routes.dart';

class AuthCoordinatorImpl implements AuthCoordinator {
  AuthCoordinatorImpl({@required this.firebaseInfo});

  final FirebaseInfo firebaseInfo;
  final _navigationKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  @override
  Future<void> start() async {
    await Future<void>.delayed(Duration(seconds: 3));
    if (await firebaseInfo.hasUserLogged) {
      goToHome();
      return;
    }
    goToLogin();
  }

  @override
  void goToHome() {
    _navigationKey.currentState.pushReplacementNamed(
      AuthRoutes.homePage,
    );
  }

  @override
  void goToLogin() {
    _navigationKey.currentState.pushReplacementNamed(
      AuthRoutes.loginPage,
    );
  }

  @override
  void goToPresentation() {
    _navigationKey.currentState.pushNamed(
      AuthRoutes.presentationPage,
    );
  }

  @override
  void goToRegister() {
    _navigationKey.currentState.pushNamed(
      AuthRoutes.registerPage,
    );
  }
}
