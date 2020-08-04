import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/core/theme/app_theme.dart';
import 'package:hiso/features/auth/presentation/bloc/splash/splash_cubit.dart';
import 'package:hiso/features/auth/presentation/pages/splash_page.dart';
import 'package:hiso/injection_container.dart' as di;
import 'package:hiso/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  di.init();
  Routes.createRoutes();
  runApp(HisoApp());
}

class HisoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiso',
      theme: AppTheme.hisoTheme,
      home: BlocProvider<SplashCubit>(
        create: (_) => dep<SplashCubit>()..verifyCurrentUser(),
        child: SplashPage(),
      ),
      onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,
    );
  }
}
