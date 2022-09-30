import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/dashboard/doctor_profile_screen.dart';
import 'package:follo_patient_app/modules/dashboard/hospital_profile_screen.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/common/rounded_corner_buttons.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:follo_patient_app/utils/utils.dart';
import 'package:lottie/lottie.dart';

import '../../protobuf_packets/follo.pb.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    Key key,
    @required this.title,
    this.aboutButtonVisibility = true,
    this.caregiverInfo,
  }) : super(key: key);

  final String title;
  final bool aboutButtonVisibility;
  final DrInfo caregiverInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: getSize(26),
        ),
        Center(child: Lottie.asset('assets/json/doctor_animation.json', height: getSize(300))),
        SizedBox(
          height: getSize(16),
        ),
        Text(
          title,
          style: TextUtils.mediumPoppinsStyle.copyWith(fontSize: getFontSize(14)),
        ),
        SizedBox(
          height: getSize(26),
        ),
        Visibility(
          visible: aboutButtonVisibility,
          child: Padding(
            padding: EdgeInsets.only(left: getSize(36), right: getSize(36)),
            child: RoundedCornerButton(
              borderRadius: BorderRadius.all(Radius.circular(getSize(36))),
              color: ColorUtils.secondaryColor,
              onPressed: () {
                if (caregiverInfo != null) {
                  Map<String, dynamic> dict = HashMap();
                  dict["caregiverInfo"] = caregiverInfo;
                  NavigationUtilities.pushRoute(DoctorProfileScreen.route, args: dict);
                } else {
                  NavigationUtilities.pushRoute(HospitalProfileScreen.route);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (caregiverInfo != null)
                    Text(
                      "About ${caregiverInfo.name}",
                      textAlign: TextAlign.center,
                      style: TextUtils.boldPoppinsStyle.copyWith(fontSize: getFontSize(14), color: Colors.white),
                    )
                  else
                    Text(
                      "About ${Utils.appName}",
                      textAlign: TextAlign.center,
                      style: TextUtils.boldPoppinsStyle.copyWith(fontSize: getFontSize(14), color: Colors.white),
                    ),
                  SizedBox(
                    width: getSize(6),
                  ),
                  Icon(
                    Icons.keyboard_double_arrow_right,
                    color: Colors.white,
                    size: getSize(32),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
