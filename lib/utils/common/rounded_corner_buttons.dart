import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/app_dimension.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/math_utils.dart';

class RoundedCornerButton extends StatefulWidget {
  RoundedCornerButton({
    @required this.onPressed,
    @required this.child,
    this.height,
    this.width = double.infinity,
    this.borderRadius,
    this.boxShadow,
    this.color = ColorUtils.primaryColor,
    this.constraints = const BoxConstraints(),
  });

  final VoidCallback onPressed;
  final Widget child;
  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow> boxShadow;
  final BoxConstraints constraints;
  final Color color;

  @override
  _RoundedCornerButtonState createState() => _RoundedCornerButtonState();
}

class _RoundedCornerButtonState extends State<RoundedCornerButton> with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => _controller.reverse(),
      child: Transform.scale(
        scale: _scale,
        child: Container(
          constraints: widget.constraints,
          height: widget.height != null ? widget.height : screenHeight(context) * 0.055,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.color ?? ColorUtils.primaryColor,
            borderRadius: widget.borderRadius != null ? widget.borderRadius : BorderRadius.circular(screenHeight(context) * 0.01),
            boxShadow: widget.boxShadow != null
                ? widget.boxShadow
                : [
                    BoxShadow(
                      color: ColorUtils.getColorFromHex("50${ColorUtils.primaryColorString}"),
                      blurRadius: AppDimension.mediumRadius, // soften the shadow
                      offset: Offset(
                        0.0, // Move to right 10  horizontally
                        10.0, // Move to bottom 10 Vertically
                      ),
                    ), // Shadow according to mobile app XD
                  ],
          ),
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
