import 'package:hiso/core/coordinator/coordinator.dart';

abstract class AuthCoordinator extends Coordinator {
  Future<void> start();
  void goToLogin();
  void goToRegister();
  void goToHome();
}
