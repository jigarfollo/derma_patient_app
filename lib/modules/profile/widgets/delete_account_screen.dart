import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/auth/login_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/common/rounded_text_buttons.dart';
import 'package:follo_patient_app/utils/decoration_utils.dart';
import 'package:follo_patient_app/utils/error_handler.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:http/http.dart' as http;

class DeleteAccountScreen extends StatefulWidget {
  static const String route = "DeleteAccountScreen";
  final String mobileNumber;

  DeleteAccountScreen({@required this.mobileNumber});

  @override
  _DeleteAccountScreenState createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final TextEditingController _pinController = TextEditingController();
  HttpService httpService = locator<HttpService>();
  GlobalData globalData = locator<GlobalData>();
  FocusNode pinFocusNode = FocusNode();
  int pinLength = 0;
  String mobileNumber;

  @override
  void initState() {
    mobileNumber = Preference.shared.getMobileNumber().toString();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorUtils.primaryColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '',
                style: TextUtils.regularPoppinsStyle.copyWith(
                  fontSize: getFontSize(12.0),
                  color: ColorUtils.bodyTextColorBlack,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * 0.08,
              child: Center(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: getSize(12.0)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: getSize(26.0),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Delete Account',
                        textAlign: TextAlign.center,
                        style: TextUtils.semiBoldPoppinsStyle.copyWith(
                          color: ColorUtils.titleTextColorWhite,
                          fontSize: getFontSize(18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Hero(
                    tag: "authContainerTag",
                    child: Material(
                      type: MaterialType.transparency,
                      child: Container(
                        width: screenWidth(context),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(getSize(24.0)),
                            topRight: Radius.circular(getSize(24.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth(context),
                    child: Padding(
                      padding: EdgeInsets.all(screenHeight(context) * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getSize(12.0), vertical: getSize(26.0)),
                            child: Text(
                              'Enter PIN to delete your account',
                              style: TextUtils.regularPoppinsStyle.copyWith(
                                fontSize: getFontSize(13.0),
                                color: Color(0XFF03050D),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: screenWidth(context) * 0.96,
                            child: PinPut(
                              validator: (String value) {
                                if (_pinController.text.length != 6) {
                                  return "Please enter PIN";
                                }
                                return "";
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              withCursor: true,
                              fieldsCount: 6,
                              focusNode: pinFocusNode,
                              textStyle: TextUtils.mediumPoppinsStyle.copyWith(
                                color: ColorUtils.primaryColor,
                                fontSize: getFontSize(20),
                              ),
                              onSubmit: (_) {
                                FocusScope.of(context).requestFocus(new FocusNode());
                              },
                              onChanged: (p) {
                                setState(() {
                                  pinLength = p.length;
                                });
                              },
                              eachFieldMargin: EdgeInsets.all(0),
                              eachFieldWidth: getSize(46.0),
                              eachFieldHeight: getSize(46.0),
                              controller: _pinController,
                              submittedFieldDecoration: DecorationUtils.customBoxDecoration,
                              selectedFieldDecoration: DecorationUtils.customBoxDecoration,
                              followingFieldDecoration: DecorationUtils.customBoxDecoration,
                              pinAnimationType: PinAnimationType.scale,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getSize(12.0), vertical: getSize(30.0)),
                            child: Text(
                              "*(Note: Once you delete the account then you won’t be able to use this app until you sign up again.)",
                              style: TextUtils.regularPoppinsStyle.copyWith(
                                fontSize: getFontSize(12),
                                color: ColorUtils.bodyTextColorBlack,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Visibility(
                            visible: pinLength == 6,
                            child: SizedBox(
                              height: screenHeight(context) * 0.04,
                            ),
                          ),
                          Visibility(
                            visible: pinLength == 6,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: getSize(50.0)),
                              child: Hero(
                                tag: "tagAuthButton",
                                child: RoundedTextButton(
                                  color: ColorUtils.redColor,
                                  text: 'Delete Now',
                                  onPressed: () async {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.QUESTION,
                                      animType: AnimType.TOPSLIDE,
                                      dismissOnTouchOutside: false,
                                      headerAnimationLoop: false,
                                      title: 'Confirmation',
                                      desc: 'Are you sure, you want to delete this account?',
                                      btnOkOnPress: () async {
                                        await deleteAccountApiCall();
                                      },
                                    )..show();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  deleteAccountApiCall() async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.patientDelete(
      userId: globalData.userId,
      userToken: globalData.userToken,
      clinicId: clinicId,
      mobileNumber: "+91" + mobileNumber,
      userPin: int.tryParse(_pinController.text),
    );
    LoadingIndicator.dismiss();

    if (response.statusCode == 200) {
      PatientDeleteResponse patientDeleteResponse = PatientDeleteResponse();
      patientDeleteResponse.mergeFromBuffer(response.bodyBytes);
      print(patientDeleteResponse.toString());
      if (patientDeleteResponse.status == "success" && patientDeleteResponse.userDeleted) {
        Preference.shared.clearSharedPreference();
        Navigator.pop(context);
        await Preference.shared.setBool(Preference.shouldRouteFromNotification, false);
        NavigationUtilities.pushReplacementNamed(
          LoginScreen.route,
        );
      } else {
        if (patientDeleteResponse.status == "auth_expired") {
          await deleteAccountApiCall();
          return;
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            dismissOnBackKeyPress: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(patientDeleteResponse.status),
            btnOkOnPress: () {
              _pinController.text = "";
              pinLength = 0;
            },
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
}
