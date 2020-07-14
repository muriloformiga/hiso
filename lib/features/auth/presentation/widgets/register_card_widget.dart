import 'package:flutter/material.dart';
import 'package:hiso/features/auth/presentation/widgets/imput_decorated_widget.dart';

class RegisterCardWidget extends StatelessWidget {
  const RegisterCardWidget({
    @required this.controller,
    @required this.placeholder,
  });

  final Map<int, TextEditingController> controller;
  final Map<int, String> placeholder;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: controller.length,
        itemBuilder: (BuildContext context, int index) {
          int key = placeholder.keys.elementAt(index);
          return ImputDecoratedWidget(
            controller: controller[key],
            placeholder: placeholder[key],
          );
        },
      ),
    );
  }
}
