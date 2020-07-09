import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';

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
        color: Color(0xFFcfe3fc),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Image.asset(
                    AppImages.family,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(26.0.w),
                  width: 414.w,
                  height: 297.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Observações Sobre Internamentos Hospitalares',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 28.h,
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Bem vindo ao App que ajuda a confortar famílias',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.h,
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
