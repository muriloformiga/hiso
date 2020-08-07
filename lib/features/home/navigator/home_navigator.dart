import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/features/home/navigator/home_routes.dart';

abstract class HomeNavigator {
  static goToPost() {
    Routes.sailor.navigate(
      HomeRoutes.postPage,
    );
  }

  static goToValidation() {
    Routes.sailor.navigate(
      HomeRoutes.validationPage,
    );
  }

  static goToSettings() {}
}
