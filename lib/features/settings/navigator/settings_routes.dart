import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:hiso/features/auth/presentation/pages/login_page.dart';
import 'package:hiso/injection_container.dart';
import 'package:sailor/sailor.dart';

abstract class SettingsRoutes {
  static const loginPage = '/login';

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
      ],
    );
  }
}
