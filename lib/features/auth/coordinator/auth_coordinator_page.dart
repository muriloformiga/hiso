import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/components/coordinator/coordinator_provider.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator_impl.dart';
import 'package:hiso/features/auth/coordinator/auth_routes.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hiso/features/auth/presentation/pages/register_page.dart';
import 'package:hiso/features/home/coordinator/home_coordinator_page.dart';
import 'package:hiso/features/auth/presentation/pages/login_page.dart';
import 'package:hiso/features/auth/presentation/pages/splash_page.dart';
import 'package:hiso/injection_container.dart';

class AuthCoordinatorScreen extends StatefulWidget {
  @override
  _AuthCoordinatorScreenState createState() => _AuthCoordinatorScreenState();
}

class _AuthCoordinatorScreenState extends State<AuthCoordinatorScreen> {
  final _coordinator = dep<AuthCoordinatorImpl>();

  @override
  void initState() {
    super.initState();
    CoordinatorProvider.instance.add<AuthCoordinator>(_coordinator);
  }

  @override
  void dispose() {
    CoordinatorProvider.instance.remove<AuthCoordinator>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _coordinator.navigationKey,
      title: 'Hiso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AuthRoutes.splashPage,
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case AuthRoutes.splashPage:
            builder = (_) {
              return SplashPage();
            };
            break;
          case AuthRoutes.homePage:
            return MaterialPageRoute<void>(
              builder: (_) => HomeCoordinatorScreen(),
            );
            break;
          case AuthRoutes.loginPage:
            builder = (_) {
              return BlocProvider<LoginBloc>(
                create: (_) => dep<LoginBloc>(),
                child: LoginPage(),
              );
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
        return MaterialPageRoute<dynamic>(builder: builder, settings: settings);
      },
    );
  }
}
