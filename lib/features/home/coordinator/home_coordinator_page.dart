import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:hiso/features/home/presentation/bloc/validation/validation_bloc.dart';
import 'package:hiso/features/home/presentation/pages/validation_page.dart';
import 'package:hiso/features/home/coordinator/home_coordinator.dart';
import 'package:hiso/features/home/coordinator/home_coordinator_impl.dart';
import 'package:hiso/features/home/coordinator/home_routes.dart';
import 'package:hiso/features/home/presentation/pages/home_page.dart';
import 'package:hiso/features/post/presentation/bloc/post_bloc.dart';
import 'package:hiso/features/post/presentation/pages/post_page.dart';
import 'package:hiso/injection_container.dart';

class HomeCoordinatorScreen extends StatefulWidget {
  @override
  _HomeCoordinatorScreenState createState() => _HomeCoordinatorScreenState();
}

class _HomeCoordinatorScreenState extends State<HomeCoordinatorScreen> {
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
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case HomeRoutes.homePage:
            builder = (_) {
              return BlocProvider<HomeBloc>(
                create: (_) => dep<HomeBloc>()..add(HomeGetUserData()),
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
        return MaterialPageRoute<dynamic>(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}
