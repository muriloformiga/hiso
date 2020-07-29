import 'package:flutter/material.dart';
import 'package:hiso/features/home/coordinator/home_routes.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/features/home/coordinator/home_coordinator.dart';
import 'package:hiso/features/home/coordinator/home_coordinator_impl.dart';

class HomeCoordinatorPage extends StatefulWidget {
  @override
  _HomeCoordinatorPageState createState() => _HomeCoordinatorPageState();
}

class _HomeCoordinatorPageState extends State<HomeCoordinatorPage> {
  final _coordinator = HomeCoordinatorImpl();

  @override
  void initState() {
    super.initState();
    CoordinatorProvider.instance.add<HomeCoordinator>(_coordinator);
  }

  @override
  void dispose() {
    CoordinatorProvider.instance.remove<HomeCoordinator>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _coordinator.navigationKey,
      initialRoute: HomeRoutes.homePage,
      onGenerateRoute: HomeRoutes.onGenerateRoute,
    );
  }
}
