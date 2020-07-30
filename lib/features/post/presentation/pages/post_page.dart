import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_gradients.dart';
import 'package:hiso/features/post/presentation/widgets/doctor_message_stack_widget.dart';
import 'package:hiso/features/post/presentation/widgets/post_register_form_widget.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.bottomGreenGradient,
      ),
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(),
            SliverToBoxAdapter(
              child: Form(
                child: Column(
                  children: <Widget>[
                    DoctorMessageStackWidget(),
                    PostRegisterFormWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
