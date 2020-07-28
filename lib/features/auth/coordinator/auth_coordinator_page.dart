import 'package:flutter/material.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/core/themes/theme.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator_impl.dart';
import 'package:hiso/features/auth/coordinator/auth_routes.dart';
import 'package:hiso/injection_container.dart';

class AuthCoordinatorPage extends StatefulWidget {
  @override
  _AuthCoordinatorPageState createState() => _AuthCoordinatorPageState();
}

class _AuthCoordinatorPageState extends State<AuthCoordinatorPage> {
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
      theme: Themes.hisoTheme,
      initialRoute: AuthRoutes.splashPage,
      onGenerateRoute: AuthRoutes.onGenerateRoute,
    );
  }
}
