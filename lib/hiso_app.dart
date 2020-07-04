import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hiso/features/auth/presentation/coordinator/auth_coordinator.dart';
import 'package:hiso/features/auth/presentation/coordinator/auth_coordinator_impl.dart';
import 'package:hiso/features/auth/presentation/coordinator/auth_routes.dart';
import 'package:hiso/features/auth/presentation/pages/register_page.dart';
import 'package:hiso/features/home/presentation/bloc/home_bloc.dart';
import 'package:hiso/features/home/presentation/pages/home_page.dart';
import 'package:hiso/features/auth/presentation/pages/login_page.dart';
import 'package:hiso/features/auth/presentation/pages/splash_page.dart';
import 'package:hiso/injection_container.dart';

class HisoApp extends StatefulWidget {
  @override
  _HisoAppState createState() => _HisoAppState();
}

class _HisoAppState extends State<HisoApp> {
  final _appCoordinator = dep<AuthCoordinatorImpl>();

  @override
  void initState() {
    super.initState();
    CoordinatorProvider.instance.add<AuthCoordinator>(_appCoordinator);
  }

  @override
  void dispose() {
    CoordinatorProvider.instance.remove<AuthCoordinator>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _appCoordinator.navigationKey,
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
            builder = (_) {
              return BlocProvider<HomeBloc>(
                create: (_) => dep<HomeBloc>(),
                child: HomePage(),
              );
            };
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
