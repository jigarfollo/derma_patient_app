import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/text_utils.dart';

import 'color_utils.dart';
import 'math_utils.dart';

class ProfileDetailWidget extends StatelessWidget {
  const ProfileDetailWidget({
    Key key,
    this.title,
    this.description = '',
    this.multiLineText = const [],
  }) : super(key: key);

  final String title;
  final String description;
  final List<String> multiLineText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextUtils.mediumPoppinsStyle.copyWith(
              color: Colors.black,
              fontSize: getFontSize(13.0),
            ),
          ),
          SizedBox(height: getSize(8)),
          Visibility(
            visible: multiLineText.isEmpty,
            child: Text(
              description,
              style: TextUtils.regularPoppinsStyle.copyWith(
                color: ColorUtils.darkGreyColor,
                fontSize: getFontSize(11.0),
              ),
            ),
          ),
          Visibility(
            visible: multiLineText.isNotEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i in Iterable.generate(multiLineText.length))
                  Text(
                    multiLineText[i],
                    style: TextUtils.regularPoppinsStyle.copyWith(
                      color: ColorUtils.darkGreyColor,
                      fontSize: getFontSize(11.0),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
