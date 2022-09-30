import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/color_utils.dart';

class TextUtils {
  static const TextStyle lightPoppinsStyle = TextStyle(
    fontFamily: 'Poppins_Light',
    fontSize: 16.0,
    color: ColorUtils.titleTextColorBlack,
  );

  static const TextStyle regularPoppinsStyle = TextStyle(
    fontFamily: 'Poppins_Regular',
    fontSize: 16.0,
    color: ColorUtils.titleTextColorBlack,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle mediumPoppinsStyle = TextStyle(
    fontFamily: 'Poppins_Medium',
    fontSize: 16.0,
    color: ColorUtils.titleTextColorBlack,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle semiBoldPoppinsStyle = TextStyle(
    fontFamily: 'Poppins_SemiBold',
    fontSize: 16.0,
    color: ColorUtils.titleTextColorBlack,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle boldPoppinsStyle = TextStyle(
    fontFamily: 'Poppins_Bold',
    fontSize: 16.0,
    color: ColorUtils.titleTextColorBlack,
    fontWeight: FontWeight.w700,
  );
}
