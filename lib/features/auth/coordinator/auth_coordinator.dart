import 'package:hiso/core/coordinator/coordinator.dart';
import 'package:hiso/features/auth/domain/entities/user_data.dart';

abstract class AuthCoordinator extends Coordinator {
  Future<void> start();
  void goToLogin();
  void goToPresentation();
  void goToRegister();
  void goToHome(UserData userData);
  void goToValidation(String userId);
}
