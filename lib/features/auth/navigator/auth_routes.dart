import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hiso/features/auth/presentation/pages/login_page.dart';
import 'package:hiso/features/auth/presentation/pages/presentation_page.dart';
import 'package:hiso/features/auth/presentation/pages/register_page.dart';
import 'package:hiso/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:hiso/features/home/presentation/pages/home_page.dart';
import 'package:hiso/injection_container.dart';
import 'package:sailor/sailor.dart';

abstract class AuthRoutes {
  static const loginPage = '/login';
  static const presentationPage = '/presentation';
  static const registerPage = '/register';
  static const homePage = '/home';

  static void createRoutes() {
    Routes.sailor.addRoutes(
      [
        SailorRoute(
          name: loginPage,
          builder: (context, args, params) {
            return BlocProvider<LoginBloc>(
              create: (_) => dep<LoginBloc>(),
              child: LoginPage(),
            );
          },
        ),
        SailorRoute(
          name: presentationPage,
          builder: (context, args, params) {
            return PresentationPage();
          },
        ),
        SailorRoute(
          name: registerPage,
          builder: (context, args, params) {
            return BlocProvider<RegisterBloc>(
              create: (_) => dep<RegisterBloc>(),
              child: RegisterPage(),
            );
          },
        ),
        SailorRoute(
          name: homePage,
          builder: (context, args, params) {
            return BlocProvider<HomeBloc>(
              create: (_) => dep<HomeBloc>()
                ..add(
                  HomeGetUserData(),
                ),
              child: HomePage(),
            );
          },
        ),
      ],
    );
  }
}
