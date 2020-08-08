import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CustomProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlareActor(
      'assets/animations/loading.flr',
      animation: 'clockwise',
    );
  }
}
