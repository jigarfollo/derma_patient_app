import 'package:flutter/material.dart';

class CommonTextFieldDecoration extends StatelessWidget {
  final Widget child;
  final BoxConstraints boxConstraints;

  const CommonTextFieldDecoration({Key key, this.child, this.boxConstraints})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: boxConstraints,
      // height: 47,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(69, 91, 99, 0.08),
            spreadRadius: 2,
            blurRadius: 30,
            offset: Offset(2, 10), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
