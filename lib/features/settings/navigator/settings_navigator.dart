import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/features/settings/navigator/settings_routes.dart';
import 'package:sailor/sailor.dart';

abstract class SettingsNavigator {
  static goToLogin() {
    Routes.sailor.navigate(
      SettingsRoutes.loginPage,
      navigationType: NavigationType.pushAndRemoveUntil,
      removeUntilPredicate: (_) => false,
    );
  }
}
