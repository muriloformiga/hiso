import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/login_bloc.dart';
import 'package:hiso/features/auth/presentation/pages/login_page.dart';
import 'package:hiso/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(HisoApp());
}

class HisoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<LoginBloc>(
        create: (_) => dep<LoginBloc>(),
        child: LoginPage(),
      ),
    );
  }
}
