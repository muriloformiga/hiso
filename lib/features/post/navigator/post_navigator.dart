import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/features/post/navigator/post_routes.dart';
import 'package:hiso/features/post/presentation/pages/timeline_page.dart';
import 'package:sailor/sailor.dart';

abstract class PostNavigator {
  static goToTimeline(String healthNumber) {
    Routes.sailor.navigate(
      PostRoutes.timelinePage,
      transitions: [
        SailorTransition.slide_from_bottom,
      ],
      args: TimelinePageArgs(
        healthNumber: healthNumber,
      ),
    );
  }
}
