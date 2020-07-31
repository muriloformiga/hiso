import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/core/info/firebase_info.dart';
import 'package:hiso/core/singletons/user.dart';
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
    final currentUser = await Future<FirebaseUser>.delayed(
      Duration(seconds: 3),
      () => firebaseInfo.currentUser,
    );
    if (currentUser != null) {
      CoordinatorProvider.instance.get<AuthCoordinator>().goToHome(currentUser);
      return;
    }
    goToLogin();
  }

  @override
  void goToHome(FirebaseUser user) {
    User.instance.setId(user.uid);
    User.instance.setEmail(user.email);
    _navigationKey.currentState.pushNamed(
      AuthRoutes.homePage,
    );
  }

  @override
  void goToLogin() {
    _navigationKey.currentState.pushNamed(
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
