import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/features/auth/presentation/coordinator/auth_coordinator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage();

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => CoordinatorProvider.instance.get<AuthCoordinator>().start(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent[200],
        child: Center(
          child: Image.asset(
            AppImages.logo,
          ),
        ),
      ),
    );
  }
}
