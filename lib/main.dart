import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiso/core/navigator/routes.dart';
import 'package:hiso/features/auth/presentation/pages/splash_page.dart';
import 'package:hiso/injection_container.dart' as di;
import 'package:sailor/sailor.dart';

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
      home: SplashPage(),
      navigatorObservers: [
        SailorLoggingObserver(),
      ],
      onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,
    );
  }
}
