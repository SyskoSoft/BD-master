import 'package:flutter/cupertino.dart';

// Get rid of glow for ListView widget by specifying custom scroll behavior

class NoGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}