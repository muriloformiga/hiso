import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/features/home/navigator/home_routes.dart';
import 'package:hiso/features/post/presentation/pages/timeline_page.dart';
import 'package:sailor/sailor.dart';

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

  static goToTimeline(String healthNumber) {
    Routes.sailor.navigate(
      HomeRoutes.timelinePage,
      transitions: [
        SailorTransition.slide_from_bottom,
      ],
      args: TimelinePageArgs(
        healthNumber: healthNumber,
      ),
    );
  }

  static goToSettings() {}
}
