import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hiso/features/auth/presentation/pages/login_page.dart';
import 'package:hiso/features/auth/presentation/pages/presentation_page.dart';
import 'package:hiso/features/auth/presentation/pages/register_page.dart';
import 'package:hiso/features/auth/presentation/pages/splash_page.dart';
import 'package:hiso/features/home/coordinator/home_coordinator_page.dart';
import 'package:hiso/injection_container.dart';

abstract class AuthRoutes {
  static const splashPage = '/';
  static const loginPage = '/login';
  static const presentationPage = '/presentation';
  static const registerPage = '/register';
  static const validationPage = '/validation';
  static const homePage = '/home';

  static Route onGenerateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case AuthRoutes.splashPage:
        builder = (_) => SplashPage();
        break;
      case AuthRoutes.homePage:
        builder = (_) => HomeCoordinatorPage();
        break;
      case AuthRoutes.loginPage:
        builder = (_) {
          return BlocProvider<LoginBloc>(
            create: (_) => dep<LoginBloc>(),
            child: LoginPage(),
          );
        };
        break;
      case AuthRoutes.presentationPage:
        builder = (_) {
          return PresentationPage();
        };
        break;
      case AuthRoutes.registerPage:
        builder = (_) {
          return BlocProvider<RegisterBloc>(
            create: (_) => dep<RegisterBloc>(),
            child: RegisterPage(),
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
