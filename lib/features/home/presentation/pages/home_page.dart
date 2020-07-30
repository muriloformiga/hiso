import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/home/coordinator/home_coordinator.dart';
import 'package:hiso/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:hiso/features/home/presentation/widgets/home/stack_action_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: AppColors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => BlocProvider.of<HomeBloc>(context).add(
              HomeLogoutStarted(),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          StackActionWidget(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLogout) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => CoordinatorProvider.instance
                      .get<AuthCoordinator>()
                      .goToLogin(),
                );
              }
              if (state is HomeUserDataInexist) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => CoordinatorProvider.instance
                      .get<HomeCoordinator>()
                      .goToValidation(),
                );
              }
              if (state is HomeDataLoadInProgress) {
                return Text('carregando...');
              }
              return Container();
              // return Column(
              //   children: <Widget>[
              //     Text(
              //       User.instance.userId,
              //     ),
              //     Text(
              //       User.instance.name,
              //     ),
              //     Text(
              //       User.instance.accountType,
              //     ),
              //   ],
              // );
            },
          ),
        ],
      ),
    );
  }
}
