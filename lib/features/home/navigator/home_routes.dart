import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/features/home/presentation/bloc/validation/validation_bloc.dart';
import 'package:hiso/features/home/presentation/pages/validation_page.dart';
import 'package:hiso/features/post/presentation/bloc/post/post_bloc.dart';
import 'package:hiso/features/post/presentation/pages/post_page.dart';
import 'package:hiso/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hiso/features/settings/presentation/pages/settings_page.dart';
import 'package:hiso/injection_container.dart';
import 'package:sailor/sailor.dart';

abstract class HomeRoutes {
  static const validationPage = '/validation';
  static const settingsPage = '/settings';
  static const postPage = '/post';

  static void createRoutes() {
    Routes.sailor.addRoutes(
      [
        SailorRoute(
          name: validationPage,
          builder: (context, args, params) {
            return BlocProvider<ValidationBloc>(
              create: (_) => dep<ValidationBloc>(),
              child: ValidationPage(),
            );
          },
        ),
        SailorRoute(
          name: postPage,
          builder: (context, args, params) {
            return BlocProvider<PostBloc>(
              create: (_) => dep<PostBloc>(),
              child: PostPage(),
            );
          },
        ),
        SailorRoute(
          name: settingsPage,
          builder: (context, args, params) {
            return BlocProvider(
              create: (context) => dep<SettingsBloc>(),
              child: SettingsPage(),
            );
          },
        ),
      ],
    );
  }
}
