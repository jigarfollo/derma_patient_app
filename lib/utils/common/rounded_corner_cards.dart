import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/math_utils.dart';

class RoundedCornerCard extends StatefulWidget {
  RoundedCornerCard({
    @required this.child,
    this.height,
    this.width,
    this.borderRadius,
    this.boxShadow,
    this.color = Colors.white,
  });

  final Widget child;
  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow> boxShadow;
  final Color color;

  @override
  _RoundedCornerCardState createState() => _RoundedCornerCardState();
}

class _RoundedCornerCardState extends State<RoundedCornerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          widget.height != null ? widget.height : screenHeight(context) * 0.055,
      width: widget.width != null ? widget.width : screenWidth(context) * 0.8,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: widget.borderRadius != null
            ? widget.borderRadius
            : BorderRadius.circular(screenHeight(context) * 0.01),
        boxShadow: widget.boxShadow != null
            ? widget.boxShadow
            : [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  blurRadius: getSize(5),
                  offset: Offset(
                    getSize(5),
                    getSize(5),
                  ),
                ), // Shadow according to mobile app XD
              ],
      ),
      child: widget.child,
    );
  }
}

class RoundedColorCornerCard extends StatefulWidget {
  RoundedColorCornerCard({
    @required this.child,
    this.height,
    this.width,
    this.borderRadius,
    this.boxShadow,
    this.color = Colors.white,
  });

  final Widget child;
  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow> boxShadow;
  final Color color;

  @override
  _RoundedColorCornerCardState createState() => _RoundedColorCornerCardState();
}

class _RoundedColorCornerCardState extends State<RoundedColorCornerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: widget.height != null ? widget.height : screenHeight(context) * 0.055,
      // width: widget.width != null ? widget.width : screenWidth(context) * 0.8,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: widget.borderRadius != null
            ? widget.borderRadius
            : BorderRadius.circular(screenHeight(context) * 0.01),
        boxShadow: widget.boxShadow != null
            ? widget.boxShadow
            : [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  blurRadius: getSize(5),
                  offset: Offset(
                    getSize(5),
                    getSize(5),
                  ),
                ), // Shadow according to mobile app XD
              ],
      ),
      child: widget.child,
    );
  }
}
