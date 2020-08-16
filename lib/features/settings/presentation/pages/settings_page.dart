import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/features/settings/navigator/settings_navigator.dart';
import 'package:hiso/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hiso/features/settings/presentation/widgets/about_app.dart';
import 'package:hiso/features/settings/utils/settings_strings.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsLogout) {
          SettingsNavigator.goToLogin();
        }
      },
      child: Container(
        color: AppColors.gray[100],
        child: Scaffold(
          appBar: AppBar(
            title: Text(SettingsStrings.settings),
          ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ListTile(
                leading: Icon(Icons.person_outline),
                title: Text(SettingsStrings.profile),
                onTap: () {},
              ),
              ListTile(
                focusColor: AppColors.gray,
                hoverColor: AppColors.blue,
                leading: Icon(Icons.info_outline),
                title: Text(SettingsStrings.aboutApp),
                onTap: () => AboutApp.showAboutDialog(context: context),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(SettingsStrings.exitApp),
                onTap: () => BlocProvider.of<SettingsBloc>(context).add(
                  SettingsLogoutStarted(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
