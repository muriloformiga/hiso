import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiso/core/coordinator/coordinator.dart';

abstract class AuthCoordinator extends Coordinator {
  Future<void> start();
  void goToLogin();
  void goToPresentation();
  void goToRegister();
  void goToHome(FirebaseUser user);
}
