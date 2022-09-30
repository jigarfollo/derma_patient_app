import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/app_dimension.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:marquee/marquee.dart';
import 'package:sizer/sizer.dart';

class RoundedTextButton extends StatefulWidget {
  const RoundedTextButton({
    @required this.onPressed,
    @required this.text,
    this.color = ColorUtils.primaryColor,
    this.height,
    this.width = double.infinity,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.marqueeEnabled = false,
  });

  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double height;
  final double width;
  final TextStyle textStyle;
  final Widget prefix;
  final Widget suffix;
  final bool marqueeEnabled;

  @override
  _RoundedTextButtonState createState() => _RoundedTextButtonState();
}

class _RoundedTextButtonState extends State<RoundedTextButton> with SingleTickerProviderStateMixin {
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
      key: Key(widget.text ?? ""),
      onTap: widget.onPressed,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => _controller.reverse(),
      child: Transform.scale(
        scale: _scale,
        child: Container(
          height: widget.height != null ? widget.height : 6.h,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(AppDimension.mediumRadius),
            boxShadow: [
              BoxShadow(
                color: ColorUtils.getColorFromHex("30${ColorUtils.primaryColorString}"),
                blurRadius: 20.0, // soften the shadow
                offset: Offset(
                  0.0, // Move to right 10  horizontally
                  10.0, // Move to bottom 10 Vertically
                ),
              ), // Shadow according to mobile app XD
            ],
          ),
          child: Stack(
            children: [
              Container(
                height: screenHeight(context) * 0.055,
                width: screenHeight(context) * 0.055,
                child: widget.prefix,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: widget.prefix != null ? 0.55.h : 0,
                  right: widget.suffix != null ? 0.55.h : 0,
                  // top: 1,
                  // bottom: 1,
                ),
                child: widget.marqueeEnabled
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Marquee(
                          blankSpace: 50,
                          velocity: 20,
                          pauseAfterRound: Duration(
                            seconds: 5,
                          ),
                          startAfter: Duration(
                            seconds: 1,
                          ),
                          showFadingOnlyWhenScrolling: true,
                          fadingEdgeStartFraction: 0.2,
                          fadingEdgeEndFraction: 0.2,
                          text: widget.text ?? "",
                          style: widget.textStyle != null
                              ? widget.textStyle
                              : TextUtils.boldPoppinsStyle.copyWith(
                                  fontSize: 14.0.sp,
                                  color: Colors.white,
                                ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.text ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: widget.textStyle != null
                              ? widget.textStyle
                              : TextUtils.boldPoppinsStyle.copyWith(
                                  fontSize: 14.0.sp,
                                  color: Colors.white,
                                ),
                        ),
                      ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: screenHeight(context) * 0.055,
                  width: screenHeight(context) * 0.055,
                  child: widget.suffix,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
