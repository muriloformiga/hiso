import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:hiso/features/auth/presentation/widgets/social_button_widget.dart';
import 'package:hiso/features/auth/utils/auth_strings.dart';

class LoginOptionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SocialButtonWidget(
          onPressed: () {
            BlocProvider.of<LoginBloc>(context).add(
              LoginGoogleStarted(),
            );
          },
          text: AuthStrings.loginGoogle,
          color: Colors.orange,
          icon: Icons.golf_course,
        ),
        SizedBox(
          height: 5.0,
        ),
        SocialButtonWidget(
          onPressed: () {},
          text: AuthStrings.loginFacebook,
          color: Colors.blueAccent,
          icon: Icons.golf_course,
        ),
      ],
    );
  }
}
