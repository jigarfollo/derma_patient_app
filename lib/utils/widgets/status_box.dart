import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/text_utils.dart';

class StatusBox extends StatelessWidget {
  const StatusBox({
    Key key,
    @required this.label,
    @required this.count,
    @required this.color,
    this.onTap,
  }) : super(key: key);

  final String label;
  final String count;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.03),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: getSize(4)),
                child: Text(
                  count.toString(),
                  style: TextUtils.semiBoldPoppinsStyle.copyWith(
                    fontSize: getFontSize(18),
                    color: color,
                  ),
                ),
              ),
              Text(
                label,
                style: TextUtils.mediumPoppinsStyle.copyWith(
                  fontSize: getFontSize(10),
                  color: color,
                ),
              ),
              SizedBox(height: getSize(6))
            ],
          ),
        ),
      ),
    );
  }
}
