import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/core/utils/app_strings.dart';
import 'package:hiso/core/utils/sizes.dart';
import 'package:hiso/core/widgets/input_text_widget.dart';
import 'package:hiso/features/home/navigator/home_navigator.dart';
import 'package:hiso/features/post/presentation/bloc/post/post_bloc.dart';
import 'package:hiso/features/post/utils/post_strings.dart';
import 'package:hiso/features/post/presentation/widgets/input_large_text_widget.dart';

class PostRegisterFormWidget extends StatelessWidget {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final hospitalController = TextEditingController();
  final healthNumberController = MaskedTextController(
    mask: '000 0000 0000 0000',
  );
  final birthDateController = MaskedTextController(
    mask: '00/00/0000',
  );
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 100.h),
      child: Form(
        child: Column(
          children: <Widget>[
            InputTextWidget(
              controller: nameController,
              text: PostStrings.name,
              color: AppColors.gray[200],
            ),
            InputTextWidget(
              controller: lastNameController,
              text: PostStrings.lastName,
            ),
            InputTextWidget(
              controller: hospitalController,
              text: PostStrings.hospital,
            ),
            InputTextWidget(
              controller: healthNumberController,
              text: PostStrings.healthNumber,
              inputType: TextInputType.number,
            ),
            InputTextWidget(
              controller: birthDateController,
              text: PostStrings.birthDate,
              inputType: TextInputType.number,
            ),
            InputLargeTextWidget(
              controller: messageController,
            ),
            BlocConsumer<PostBloc, PostState>(
              listener: (context, state) {
                if (state is PostPacientRegisterSucess) {
                  HomeNavigator.goToTimeline(state.healthNumber);
                }
                if (state is PostPacientRegisterError) {
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is PostPacientRegisterLoading) {
                  return CircularProgressIndicator();
                }
                return CupertinoButton.filled(
                  child: Text(AppStrings.register),
                  onPressed: () => BlocProvider.of<PostBloc>(context).add(
                    PostPacientRegisterStarted(
                      name: nameController.text,
                      lastName: lastNameController.text,
                      hospital: hospitalController.text,
                      healthNumber: healthNumberController.text,
                      birthDate: birthDateController.text,
                      message: messageController.text,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
