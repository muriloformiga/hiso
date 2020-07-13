import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/home/coordinator/home_coordinator.dart';
import 'package:hiso/features/home/presentation/bloc/home/home_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => BlocProvider.of<HomeBloc>(context).add(
              HomeLogoutStarted(),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: BlocBuilder<HomeBloc, HomeState>(
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
              if (state is HomeUserDataLoadSucess) {
                return Column(
                  children: <Widget>[
                    Text(
                      User.instance.userId,
                    ),
                    Text(
                      User.instance.name,
                    ),
                    Text(
                      User.instance.accountType,
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
