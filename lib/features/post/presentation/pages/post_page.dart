import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/features/post/presentation/widgets/doctor_message_stack_widget.dart';
import 'package:hiso/features/post/presentation/widgets/post_register_widget.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: AppColors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DoctorMessageStackWidget(),
            PostRegisterWidget(),
          ],
        ),
      ),
    );
  }
}
