import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/core/widgets/custom_background_widget.dart';
import 'package:hiso/core/widgets/custom_error_widget.dart';
import 'package:hiso/core/widgets/custom_progress_widget.dart';
import 'package:hiso/features/auth/navigator/auth_navigator.dart';
import 'package:hiso/features/home/navigator/home_navigator.dart';
import 'package:hiso/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:hiso/features/home/presentation/pages/professional_page.dart';
import 'package:hiso/features/home/presentation/pages/family_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeUserDataInexist) {
          HomeNavigator.goToValidation();
        }
        if (state is HomeLogout) {
          AuthNavigator.goToLogin();
        }
      },
      builder: (context, state) {
        if (state is HomeUserDataLoadError) {
          return CustomErrorWidget();
        }
        if (state is HomeUserDataLoadSucess) {
          if (User.instance.accountType == 'Profissional') {
            return ProfessionalPage();
          }
          return FamilyPage();
        }
        return CustomBackgroundWidget(
          child: SizedBox(
            height: 80.h,
            width: 80.h,
            child: CustomProgressWidget(),
          ),
        );
      },
    );
  }
}
