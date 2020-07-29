import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:hiso/features/home/presentation/bloc/validation/validation_bloc.dart';
import 'package:hiso/features/home/presentation/pages/home_page.dart';
import 'package:hiso/features/home/presentation/pages/validation_page.dart';
import 'package:hiso/features/post/presentation/bloc/post_bloc.dart';
import 'package:hiso/features/post/presentation/pages/post_page.dart';
import 'package:hiso/injection_container.dart';

abstract class HomeRoutes {
  static const homePage = '/';
  static const validationPage = '/validation';
  static const postPage = '/post';
  static const settingsPage = '/settings';

  static Route onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case HomeRoutes.homePage:
        builder = (_) {
          return BlocProvider<HomeBloc>(
            create: (_) => dep<HomeBloc>()
              ..add(
                HomeGetUserData(),
              ),
            child: HomePage(),
          );
        };
        break;
      case HomeRoutes.validationPage:
        builder = (_) {
          return BlocProvider<ValidationBloc>(
            create: (_) => dep<ValidationBloc>()
              ..add(
                ValidationLoadDataStarted(),
              ),
            child: ValidationPage(),
          );
        };
        break;
      case HomeRoutes.postPage:
        builder = (_) {
          return BlocProvider<PostBloc>(
            create: (_) => dep<PostBloc>(),
            child: PostPage(),
          );
        };
        break;
    }
    return CupertinoPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
