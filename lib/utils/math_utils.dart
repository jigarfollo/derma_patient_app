import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:sizer/sizer.dart';

class MathUtilities {
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static safeAreaTopHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static safeAreaBottomHeight(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;
}

dynamic getSize(double px) {
  return px *
      (MathUtilities.screenWidth(
              NavigationUtilities.key.currentState.overlay.context) /
          414);
}

dynamic getFontSize(double px) {
  return (px - 2).sp;
  // * (MathUtilities.screenWidth(NavigationUtilities.key.currentState.overlay.context) / 414) + 2;
}

dynamic getPercentageWidth(double percentage) {
  return MathUtilities.screenWidth(
          NavigationUtilities.key.currentState.overlay.context) *
      percentage /
      100;
}

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
