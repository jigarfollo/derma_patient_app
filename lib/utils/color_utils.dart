import 'package:flutter/material.dart';

class ColorUtils {
  static const String primaryColorString = '#d59240';
  static const String primaryDarkColorString = '#d59240';
  static const Color primaryColor = Color(0XFFd59240);
  static const Color titleTextColorWhite = Color(0XFFFFFFFF);
  static const Color bodyTextColorWhite = Color(0XFFDEDEDF);
  static const Color titleTextColorBlack = Color(0XFF313450);
  static const Color bodyTextColorBlack = Color(0XFF898A8F);
  static const Color cardShadowColor = Color(0X20000017);
  static const Color cardBorderColor = Color(0XFFECECEC);
  static final Color hintTextColor = getColorFromHex("#99A0B1");
  // static final Color secondaryColor = Color(0XFF888b8d);
  // static final Color darkersecondaryColor = Color(0XFF888b8d);
  static final Color greenSuccessColor = Color(0XFF27AE60);
  static final Color dropdownColor = Color(0XFFBEC6D1);
  static final Color disabledTextFieldColor = getColorFromHex("#F6F6F6");
  static final Color backgroundGreyColor = getColorFromHex("#F5F5F5");
  static final Color darkGreyColor = getColorFromHex("#6B6B6B");
  static final Color tableFontColor = getColorFromHex("#898A8F");
  static final Color tableSummaryBorderColor = getColorFromHex("#D6D6D6");
  static final Color screenBackgroundTextColor = getColorFromHex("#767676");
  static final Color successGreenColor = getColorFromHex("#00B41C");

  static Color greenColor = getColorFromHex("#39BC65");
  static Color purpleColor = getColorFromHex("#5E2AB8");
  static Color redColor = getColorFromHex("#FF0000");
  static Color pinkColor = getColorFromHex("#D627D1");
  static Color greenColor2 = Color(0xFF4FB170);
  static Color onlineStatus = Color(0xFF46E54C);
  static Color darkFontColor = Color(0xFF141414);
  static Color primaryBackgroundTextColor = getColorFromHex("#d59240");
  static Color secondaryColor = getColorFromHex("#21201e");

  static Color headerColor = getColorFromHex("#262626");
  static Color greyColor = getColorFromHex("#98A2B5");
  static Color darkTextColor = getColorFromHex("#222222");
  static Color borderColor = Color(0xffe0e3e9);
  static Color bgColor = Color(0xffecedef);
  static Color shadowColor = getColorFromHex("#00000029");
  static Color greyTextColor = getColorFromHex("#898A8F");

  static Color greenTextColor = getColorFromHex("#637784");
  static Color titleColor = getColorFromHex("#141414");
  static Color textFieldBorderColor = getColorFromHex("#DEDEDF");
  static Color blueTextColor = getColorFromHex("#257DB8");
  static Color greyButtonColor = getColorFromHex("#BEC6D1");
  static Color yellowTextColor = Color(0XFFFFDA69);
  static Color darkerYellowTextColor = Color(0XFFEBB103);
  static Color titleTextColor = getColorFromHex("#353535");
  static Color incomingMessageTextColor = getColorFromHex("#F1F1F1");
  static Color pinTextColor = Color.fromRGBO(51, 51, 51, 0.87);
  static Color textColor = Color(0xff2F2E41);
  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
