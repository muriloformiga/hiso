import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/home/presentation/bloc/home_bloc.dart';

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
              if (state is HomeFailure) {
                Text(state.message);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
