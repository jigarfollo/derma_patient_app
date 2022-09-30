import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/text_utils.dart';

class UnderlineText extends StatelessWidget {
  const UnderlineText({
    Key key,
    @required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextUtils.semiBoldPoppinsStyle.copyWith(
        fontSize: getFontSize(14),
        color: ColorUtils.darkFontColor,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
