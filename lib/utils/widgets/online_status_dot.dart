import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/color_utils.dart';

class OnlineStatusDot extends StatelessWidget {
  const OnlineStatusDot({
    Key key,
    this.size = 10,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: ColorUtils.onlineStatus,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
