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
  List<Patient> _patientList = [];
  final ScrollController _controller = ScrollController();

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
    patientListApiCall();
    super.initState();
  }

  void _animateToIndex(int index) {
    _controller.animateTo(
      index * screenWidth(context) * 0.45 - 100,
      duration: Duration(microseconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  prefillPatientApiCall() async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.fetchPatient(
      userId: globalData.userId,
      userToken: globalData.userToken,
      clinicId: clinicId,
      mobileNumber: "+91" + mobileNumber,
      patientProfileId: Preference.shared.getSelectedPatientProfileId(),
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    PatientSignupScreen(mobileNumber: mobileNumber, isForEdit: true, patient: fetchPatientResponse.patientdata))).then((value) async {
          await patientListApiCall();
        });
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

  patientListApiCall() async {
    http.Response response = await httpService.patientList(
      userId: globalData.userId,
      userToken: globalData.userToken,
      clinicId: clinicId,
      mobileNumber: "+91" + mobileNumber,
    );

    if (response.statusCode == 200) {
      _patientList = [];
      PatientListResponse patientListResponse = PatientListResponse();
      patientListResponse.mergeFromBuffer(response.bodyBytes);

      if (patientListResponse.status == "success") {
        log(patientListResponse.patientdata.length.toString());
        for (var i = 0; i < patientListResponse.patientdata.length; i++) {
          _patientList.add(patientListResponse.patientdata[i]);
        }
        print(Preference.shared.getSelectedPatientProfileId());
        if (Preference.shared.getSelectedPatientProfileId() == null || Preference.shared.getSelectedPatientProfileId() == "") {
          await Preference.shared.setSelectedPatientProfileId(patientListResponse.patientdata[0].patientProfileId ?? "");
        } else {
          for (var i = 0; i < _patientList.length; i++) {
            if (_patientList[i].patientProfileId == Preference.shared.getSelectedPatientProfileId()) {
              await Preference.shared.setSelectedPatientProfileId(_patientList[i].patientProfileId ?? "");
              _animateToIndex(i);
            }
          }
        }
        setState(() {});
        log(_patientList.length.toString());
      } else {
        if (patientListResponse.status == "auth_expired") {
          await patientListApiCall();
          return;
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(patientListResponse.status),
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
        desc: "Something went wrong!",
        btnOkOnPress: () {},
      )..show();
      return;
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
                height: screenHeight(context) * 0.205,
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
                height: screenHeight(context) * 0.20,
                width: screenWidth(context),
                fit: BoxFit.cover,
              ),
              Container(
                height: screenHeight(context) * 0.20,
                child: Column(
                  children: [
                    SizedBox(
                      height: getSize(52),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: getSize(26), right: getSize(26), bottom: getSize(16)),
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
                    Container(
                      padding: EdgeInsets.only(left: getSize(8)),
                      height: screenHeight(context) * 0.07,
                      child: ListView.builder(
                          itemCount: _patientList.length,
                          scrollDirection: Axis.horizontal,
                          controller: _controller,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(right: getSize(8)),
                              child: InkWell(
                                onTap: () {
                                  Preference.shared.setSelectedPatientProfileId(_patientList[index].patientProfileId ?? "");
                                  _animateToIndex(index);
                                  // _setDateToDatePicker();
                                  setState(() {});
                                },
                                child: Container(
                                  height: getSize(16),
                                  width: screenWidth(context) * 0.45,
                                  decoration: BoxDecoration(
                                      color: _patientList[index].patientProfileId == Preference.shared.getSelectedPatientProfileId()
                                          ? ColorUtils.secondaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(getSize(26))),
                                      border: Border.all(color: ColorUtils.secondaryColor, width: getSize(2))),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: getSize(8), top: getSize(7), bottom: getSize(6), right: getSize(4)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        _patientList[index].profilePicture.url.isNotEmpty
                                            ? Center(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(getSize(100)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return SimpleDialog(
                                                            contentPadding: EdgeInsets.zero,
                                                            backgroundColor: Colors.transparent,
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: InteractiveViewer(
                                                                  child: Image.network(
                                                                    _patientList[index].profilePicture.url,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Image.network(
                                                      _patientList[index].profilePicture.url.toString(),
                                                      width: getSize(32),
                                                      height: getSize(32),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Center(
                                                child: CircleAvatar(
                                                  radius: screenWidth(context) * 0.04,
                                                  // backgroundColor: ColorUtils.secondaryColor,
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    child: Image.asset(
                                                      _patientList[index].gender.toString().toLowerCase() == "male"
                                                          ? ImageConstants.maleProfileIcon
                                                          : ImageConstants.femaleProfileIcon ?? ImageConstants.maleProfileIcon,
                                                      color: ColorUtils.primaryColor.withOpacity(0.7),
                                                    ),
                                                    radius: screenWidth(context) * 0.04,
                                                  ),
                                                ),
                                              ),
                                        SizedBox(
                                          width: getSize(8),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: screenWidth(context) * 0.28,
                                              child: Text(
                                                _patientList[index].firstName + " " + _patientList[index].lastName,
                                                style: TextUtils.mediumPoppinsStyle.copyWith(
                                                  color: _patientList[index].patientProfileId == Preference.shared.getSelectedPatientProfileId()
                                                      ? Colors.white
                                                      : ColorUtils.secondaryColor,
                                                  fontSize: getFontSize(12.0),
                                                  fontWeight: FontWeight.w700,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                            SizedBox(
                                              height: getSize(2),
                                            ),
                                            Center(
                                              child: Text(
                                                "Age : ${_patientList[index].age}",
                                                style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                                  color: _patientList[index].patientProfileId == Preference.shared.getSelectedPatientProfileId()
                                                      ? Colors.white
                                                      : ColorUtils.secondaryColor,
                                                  fontSize: getFontSize(10.0),
                                                  fontWeight: FontWeight.w700,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
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
