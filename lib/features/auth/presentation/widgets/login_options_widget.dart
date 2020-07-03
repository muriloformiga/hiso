import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiso/core/utils/strings/strings.dart';
import 'package:hiso/features/auth/presentation/bloc/login_bloc.dart';
import 'package:hiso/features/auth/presentation/widgets/social_button_widget.dart';

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
          text: Strings.loginGoogle,
          color: Colors.orange,
          icon: Icons.golf_course,
        ),
        SizedBox(
          height: 5.0,
        ),
        SocialButtonWidget(
          onPressed: () {},
          text: Strings.loginFacebook,
          color: Colors.blueAccent,
          icon: Icons.golf_course,
        ),
        SizedBox(
          height: 5.0,
        ),
        SocialButtonWidget(
          onPressed: () {
            BlocProvider.of<LoginBloc>(context).add(
              LoginLogoutStarted(),
            );
          },
          text: Strings.loginTwitter,
          color: Colors.lightBlue,
          icon: Icons.golf_course,
        ),
      ],
    );
  }
}
