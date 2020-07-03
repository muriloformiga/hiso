import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiso/features/auth/presentation/widgets/register_form_widget.dart';

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              RegisterFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
