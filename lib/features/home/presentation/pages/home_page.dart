import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/singletons/user.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/widgets/custom_progress_widget.dart';
import 'package:hiso/features/auth/navigator/auth_navigator.dart';
import 'package:hiso/features/home/navigator/home_navigator.dart';
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
          BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeUserDataInexist) {
                HomeNavigator.goToValidation();
              }
              if (state is HomeLogout) {
                AuthNavigator.goToLogin();
              }
            },
            buildWhen: (previous, current) {
              return true;
            },
            builder: (context, state) {
              if (state is HomeUserDataLoading) {
                return CustomProgressWidget();
              }
              if (state is HomeUserDataLoadSucess) {
                BlocProvider.of<HomeBloc>(context)
                    .add(HomeGetMedicalPacients());
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
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeMedicalPacientsLoadSucess) {
                final pacients = state.pacients;
                return ListView.builder(
                  itemCount: pacients.length,
                  itemBuilder: (context, index) {
                    return Text(pacients[index].name);
                  },
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
