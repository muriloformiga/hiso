import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/core/utils/app_colors.dart';
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.white,
            AppColors.verde,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Container(
                      width: 375.w,
                      height: 196.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(250),
                        ),
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 466.w,
                    height: 336.h,
                    child: Image.asset(
                      AppImages.family,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 375.w,
                    height: 196.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(250),
                      ),
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
