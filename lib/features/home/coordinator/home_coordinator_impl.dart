import 'package:flutter/material.dart';
import 'package:hiso/features/home/coordinator/home_coordinator.dart';
import 'package:hiso/features/home/coordinator/home_routes.dart';

class HomeCoordinatorImpl implements HomeCoordinator {
  final _navigationKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  @override
  void goToSettings() {
    _navigationKey.currentState.pushNamed(
      HomeRoutes.settingsPage,
    );
  }

  @override
  void goToValidation() {
    _navigationKey.currentState.pushReplacementNamed(
      HomeRoutes.validationPage,
    );
  }

  @override
  void goToPost() {
    _navigationKey.currentState.pushNamed(
      HomeRoutes.postPage,
    );
  }
}
