import 'package:flutter/material.dart';
import 'package:hiso/core/utils/app_images.dart';
import 'package:hiso/core/utils/sizes.dart';

class CustomErrorWidget extends StatelessWidget {
  CustomErrorWidget({
    this.onTap,
    this.errorMessage = 'Tivemos um problema',
  });

  final Function onTap;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            AppImages.error,
            height: 70.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            '$errorMessage\nToque para tentar novamente.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
