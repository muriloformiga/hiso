import 'package:flutter/animation.dart';
import 'package:hiso/features/auth/navigator/auth_routes.dart';
import 'package:hiso/features/home/navigator/home_routes.dart';
import 'package:sailor/sailor.dart';

abstract class Routes {
  static final sailor = Sailor(
    options: SailorOptions(
      defaultTransitionCurve: Curves.easeInOut,
      defaultTransitions: [
        SailorTransition.slide_from_right,
      ],
    ),
  );

  static void createRoutes() {
    AuthRoutes.createRoutes();
    HomeRoutes.createRoutes();
  }
}
