import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/coordinator/coordinator_provider.dart';
import 'package:hiso/features/auth/coordinator/auth_coordinator.dart';
import 'package:hiso/features/auth/presentation/bloc/validation/validation_bloc.dart';
import 'package:hiso/features/auth/presentation/widgets/validation/userdata_form_widget.dart';

class ValidationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<ValidationBloc, ValidationState>(
            builder: (context, state) {
              if (state is ValidationSucess) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) => CoordinatorProvider.instance
                      .get<AuthCoordinator>()
                      .goToHome(state.userData),
                );
              }
              if (state is ValidationFailure) {
                return UserDataFormWidget();
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
