import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/features/auth/navigator/auth_routes.dart';
import 'package:sailor/sailor.dart';

abstract class AuthNavigator {
  static goToHome() {
    Routes.sailor.navigate(
      AuthRoutes.homePage,
      navigationType: NavigationType.pushReplace,
    );
  }

  static goToLogin() {
    Routes.sailor.navigate(
      AuthRoutes.loginPage,
      navigationType: NavigationType.pushReplace,
    );
  }

  static goToPresentation() {
    Routes.sailor.navigate(
      AuthRoutes.presentationPage,
    );
  }

  static goToRegister() {
    Routes.sailor.navigate(
      AuthRoutes.registerPage,
    );
  }
}
