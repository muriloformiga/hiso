import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/features/post/domain/entities/pacient.dart';
import 'package:hiso/features/post/navigator/post_routes.dart';
import 'package:hiso/features/post/presentation/pages/timeline_page.dart';
import 'package:sailor/sailor.dart';

abstract class PostNavigator {
  static goToTimeline(Pacient pacient) {
    Routes.sailor.navigate(
      PostRoutes.timelinePage,
      transitions: [
        SailorTransition.slide_from_bottom,
      ],
      args: TimelinePageArgs(
        pacient: pacient,
      ),
    );
  }
}
