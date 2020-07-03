import 'package:flutter/cupertino.dart';

class SocialButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final IconData icon;

  SocialButtonWidget({
    @required this.onPressed,
    @required this.text,
    @required this.color,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            icon,
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      borderRadius: BorderRadius.circular(20),
      color: color,
      onPressed: onPressed,
    );
  }
}
