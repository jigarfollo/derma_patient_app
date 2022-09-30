import 'package:flutter/material.dart';

class Utils {
  static String appName = 'Derma Cares';
  static BuildContext globalContext;
  static const String listSaparator = "'\$'|'\$'";
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
