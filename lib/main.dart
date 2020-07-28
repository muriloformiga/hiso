import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator_page.dart';
import 'package:hiso/injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  di.init();
  runApp(HisoApp());
}

class HisoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthCoordinatorPage();
  }
}
