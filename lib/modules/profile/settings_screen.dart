import 'dart:collection';
import 'dart:developer';
import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/auth/patient_signup_screen.dart';
import 'package:follo_patient_app/modules/auth/verify_otp_screen.dart';
import 'package:follo_patient_app/modules/profile/widgets/delete_account_screen.dart';
import 'package:follo_patient_app/modules/profile/widgets/logout_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/common/emergency_button.dart';
import 'package:follo_patient_app/utils/error_handler.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:follo_patient_app/utils/widgets/bouncy_button.dart';
import 'package:http/http.dart' as http;

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  GlobalData globalData = locator<GlobalData>();
  HttpService httpService = locator<HttpService>();
  String mobileNumber;
  List<String> listItems = [
    "My Profile",
    "Reset PIN",
    "Logout",
    "Delete My Account",
  ];

  List<IconData> profilePageIcons = [
    Icons.person,
    Icons.info_rounded,
    Icons.logout,
    Icons.delete_forever_outlined,
  ];
  @override
  void initState() {
    mobileNumber = Preference.shared.getMobileNumber().toString();
    super.initState();
  }

  prefillPatientApiCall() async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.fetchPatient(
      userId: globalData.userId,
      userToken: globalData.userToken,
      clinicId: clinicId,
      mobileNumber: "+91" + mobileNumber,
    );
    LoadingIndicator.dismiss();

    if (response.statusCode == 200) {
      FetchPatientResponse fetchPatientResponse = FetchPatientResponse();
      fetchPatientResponse.mergeFromBuffer(response.bodyBytes);
      print(fetchPatientResponse.toString());
      if (fetchPatientResponse.status == "success") {
        log(fetchPatientResponse.patientdata.toString());
        Map<String, dynamic> dict = HashMap();
        dict["mobileNumber"] = mobileNumber;
        dict["isForEdit"] = true;
        dict["patient"] = fetchPatientResponse.patientdata;
        NavigationUtilities.pushRoute(
          PatientSignupScreen.route,
          args: dict,
        );
      } else {
        if (fetchPatientResponse.status == "auth_expired") {
          await prefillPatientApiCall();
          return;
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(fetchPatientResponse.status),
            btnOkOnPress: () {},
          )..show();
        }
      }
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.TOPSLIDE,
        dismissOnTouchOutside: false,
        headerAnimationLoop: false,
        title: 'ERROR',
        desc: ErrorHandler().getErrorMessage("Something went wrong!"),
        btnOkOnPress: () {},
      )..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundGreyColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: screenHeight(context) * 0.11,
                decoration: BoxDecoration(
                  color: ColorUtils.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(getSize(30.0)),
                    bottomRight: Radius.circular(getSize(30.0)),
                  ),
                ),
              ),
              Image.asset(
                ImageConstants.backgroundMask1,
                height: screenHeight(context) * 0.11,
                width: screenWidth(context),
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.only(left: getSize(26), right: getSize(26), bottom: getSize(16)),
                height: screenHeight(context) * 0.11,
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'My Account',
                      textAlign: TextAlign.left,
                      style: TextUtils.semiBoldPoppinsStyle.copyWith(
                        color: ColorUtils.titleTextColorWhite,
                        fontSize: getFontSize(15.0),
                      ),
                    ),
                    Spacer(),
                    EmergencyButton(),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: getSize(16),
                right: getSize(16),
              ),
              child: ListView.builder(
                itemCount: listItems.length,
                padding: EdgeInsets.only(top: getSize(8)),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) * 0.018,
                    ),
                    margin: EdgeInsets.only(top: screenWidth(context) * 0.028),
                    height: screenWidth(context) * 0.11,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 2.0),
                          color: Color(0xFFECECEC),
                          blurRadius: 6,
                          spreadRadius: 4,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: BouncyButton(
                      onPressed: () async {
                        if (index == 0) {
                          await prefillPatientApiCall();
                        } else if (index == 1) {
                          Map<String, dynamic> dict = HashMap();
                          dict["mobileNumber"] = "+91" + mobileNumber;
                          NavigationUtilities.pushRoute(
                            VerifyOTPScreen.route,
                            args: dict,
                          );
                        } else if (index == 2) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: LogoutPopUp(),
                            ),
                          );
                        } else if (index == 3) {
                          Map<String, dynamic> dict = HashMap();
                          dict["mobileNumber"] = mobileNumber;
                          NavigationUtilities.pushRoute(
                            DeleteAccountScreen.route,
                            args: dict,
                          );
                        }
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: screenWidth(context) * 0.09,
                            width: screenWidth(context) * 0.09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              profilePageIcons[index],
                              color: ColorUtils.primaryColor,
                              size: screenWidth(context) * 0.05,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            listItems[index],
                            style: TextUtils.regularPoppinsStyle.copyWith(
                              color: ColorUtils.darkGreyColor,
                              fontSize: getFontSize(12),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: getSize(16),
                            color: ColorUtils.primaryColor.withOpacity(.7),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
