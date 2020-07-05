import 'package:hiso/core/components/coordinator/coordinator.dart';

abstract class AuthCoordinator extends Coordinator {
  Future<void> start();
  void goToLogin();
  void goToPresentation();
  void goToRegister();
  void goToHome();
}
