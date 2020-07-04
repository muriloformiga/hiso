import 'package:flutter/material.dart';
import 'package:hiso/hiso_app.dart';
import 'package:hiso/injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HisoApp();
  }
}
