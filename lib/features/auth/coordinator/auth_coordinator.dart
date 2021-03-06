import 'package:hiso/core/coordinator/coordinator.dart';

abstract class AuthCoordinator extends Coordinator {
  Future<void> start();
  void goToLogin();
  void goToPresentation();
  void goToRegister();
  void goToHome(String userId);
}
