import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/text_utils.dart';

class DecorationUtils {
  static BoxDecoration customBoxDecoration = BoxDecoration(
    color: Colors.white,
    border: Border.all(
      color: ColorUtils.cardBorderColor,
      width: getSize(1.0),
    ),
    borderRadius: BorderRadius.circular(getSize(8.0)),
    boxShadow: [
      // Shadow according to mobile app XD
      // BoxShadow(
      //   color: ColorUtils.cardShadowColor,
      //   blurRadius: getSize(10.0), // soften the shadow
      //   offset: Offset(
      //     getSize(0.0), // Move to right 10  horizontally
      //     getSize(3.0), // Move to bottom 10 Vertically
      //   ),
      // ),
      // Shadow according to web app XD
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        blurRadius: getSize(30),
        offset: Offset(
          getSize(2),
          getSize(10),
        ),
      ),
    ],
  );

  static InputDecoration customInputDecoration = InputDecoration(
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
    fillColor: Colors.white,
    counterText: '',
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelText: 'Enter WhatsApp Number',
    labelStyle: TextUtils.regularPoppinsStyle.copyWith(
      color: ColorUtils.hintTextColor,
      fontSize: getFontSize(12),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(getSize(8.0)),
      borderSide: BorderSide(
        color: Color.fromRGBO(222, 222, 223, 1),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(getSize(8.0)),
      borderSide: BorderSide(
        color: Color.fromRGBO(222, 222, 223, 1),
      ),
    ),
  );
}
