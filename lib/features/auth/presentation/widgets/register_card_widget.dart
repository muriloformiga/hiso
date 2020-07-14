import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_colors.dart';
import 'package:hiso/features/auth/presentation/widgets/imput_decorated_widget.dart';
import 'package:hiso/core/utils/sizes.dart';

class RegisterCardWidget extends StatelessWidget {
  const RegisterCardWidget({
    Key key,
    @required this.controller,
    @required this.placeholder,
  }) : super(key: key);

  final List<TextEditingController> controller;
  final List<String> placeholder;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.hawkesBlue,
      borderOnForeground: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ImputDecoratedWidget(
            controller: controller[0],
            placeholder: placeholder[0],
          ),
          ImputDecoratedWidget(
            controller: controller[1],
            placeholder: placeholder[1],
          ),
          ImputDecoratedWidget(
            controller: controller[2],
            placeholder: placeholder[2],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
