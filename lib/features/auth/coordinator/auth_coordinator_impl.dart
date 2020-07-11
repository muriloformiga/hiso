import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/info/firebase_info.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/auth/coordinator/auth_routes.dart';
import 'package:hiso/features/auth/domain/entities/user_data.dart';

class AuthCoordinatorImpl implements AuthCoordinator {
  AuthCoordinatorImpl({@required this.firebaseInfo});

  final FirebaseInfo firebaseInfo;
  final _navigationKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  @override
  Future<void> start() async {
    final currentUser = await Future<FirebaseUser>.delayed(
      Duration(seconds: 2),
      () => firebaseInfo.currentUser,
    );
    if (currentUser != null) {
      goToValidation(currentUser.uid);
      return;
    }
    goToLogin();
  }

  @override
  void goToHome(UserData userData) {
    User.instance.setName(userData.name);
    User.instance.setAccountType(userData.accountType);
    _navigationKey.currentState.pushReplacementNamed(
      AuthRoutes.homePage,
    );
  }

  @override
  void goToValidation(String userId) {
    User.instance.setId(userId);
    _navigationKey.currentState.pushReplacementNamed(
      AuthRoutes.validationPage,
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
