import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/app_dimension.dart';

import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:sizer/sizer.dart';

class CustomCard extends StatelessWidget {
  CustomCard({@required this.child, this.height});

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorUtils.cardBorderColor,
          width: 0.0.h,
        ),
        borderRadius: BorderRadius.circular(AppDimension.smallRadius),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 30,
            offset: Offset(
              2,
              10,
            ),
          ), // Shadow according to web app XD
        ],
      ),
      child: child,
    );
  }
}
