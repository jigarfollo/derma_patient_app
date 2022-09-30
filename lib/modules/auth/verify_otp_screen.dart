import 'dart:async';
import 'dart:collection';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/auth/reset_pin_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/common/rounded_text_buttons.dart';
import 'package:follo_patient_app/utils/decoration_utils.dart';
import 'package:follo_patient_app/utils/error_handler.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class VerifyOTPScreen extends StatefulWidget {
  static const String route = "VerifyOTPScreen";
  final String mobileNumber;

  VerifyOTPScreen({@required this.mobileNumber});

  @override
  _VerifyOTPScreenState createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  HttpService httpService = locator<HttpService>();

  int oldOTP;
  bool otpVerified = false;
  bool isOTPNotEntered = false;

  FocusNode otpFocusNode = FocusNode();

  // timer
  Timer _timer;
  int _start = 60;
  bool resendActive = false;
  int noOfResendClicked = 0;

  @override
  void initState() {
    sendOTP();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
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
                        'OTP Verify',
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
                            padding: EdgeInsets.all(getSize(12.0)),
                            child: Text(
                              'Please type the verification code sent to your registered mobile number',
                              style: TextUtils.regularPoppinsStyle.copyWith(
                                fontSize: getFontSize(13.0),
                                color: Color(0XFF03050D),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            '${widget.mobileNumber}',
                            style: TextUtils.mediumPoppinsStyle.copyWith(
                              fontSize: getFontSize(20.0),
                              color: Color(0XFF98A2B5),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getSize(12.0), vertical: getSize(30.0)),
                            child: Text(
                              'Enter OTP to reset your PIN',
                              style: TextUtils.regularPoppinsStyle.copyWith(
                                fontSize: getFontSize(13.0),
                                color: Color(0XFF03050D),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: screenWidth(context) * 0.70,
                            child: PinPut(
                              validator: (String value) {
                                if (_otpController.text.length != 4) {
                                  return "Please enter OTP";
                                }
                                return "";
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              withCursor: true,
                              fieldsCount: 4,
                              focusNode: otpFocusNode,
                              textStyle: TextUtils.mediumPoppinsStyle.copyWith(
                                color: ColorUtils.primaryColor,
                                fontSize: getFontSize(20),
                              ),
                              eachFieldMargin: EdgeInsets.all(0),
                              eachFieldWidth: getSize(55.0),
                              eachFieldHeight: getSize(55.0),
                              controller: _otpController,
                              submittedFieldDecoration: DecorationUtils.customBoxDecoration,
                              selectedFieldDecoration: DecorationUtils.customBoxDecoration,
                              followingFieldDecoration: DecorationUtils.customBoxDecoration,
                              pinAnimationType: PinAnimationType.scale,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getSize(12.0), vertical: getSize(30.0)),
                            child: Text(
                              '00:' + _start.toString().padLeft(2, '0'),
                              style: TextUtils.regularPoppinsStyle.copyWith(
                                fontSize: getFontSize(12),
                                color: ColorUtils.bodyTextColorBlack,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getSize(50.0)),
                            child: Hero(
                              tag: "tagAuthButton",
                              child: RoundedTextButton(
                                text: 'Verify Now',
                                onPressed: () async {
                                  if (_otpController.text.length == 4) {
                                    await verifyOTP();
                                    if (otpVerified == true) {
                                      AwesomeDialog(
                                        dismissOnBackKeyPress: false,
                                        context: context,
                                        dialogType: DialogType.SUCCES,
                                        animType: AnimType.TOPSLIDE,
                                        dismissOnTouchOutside: false,
                                        headerAnimationLoop: false,
                                        title: 'SUCCESS',
                                        desc: "Your OTP is successfully verified.",
                                        btnOkOnPress: () {
                                          Map<String, dynamic> dict = HashMap();
                                          dict["mobileNumber"] = widget.mobileNumber;
                                          dict["otp"] = int.tryParse(_otpController.text.toString());
                                          NavigationUtilities.pushReplacementNamed(
                                            ResetPINScreen.route,
                                            args: dict,
                                          );
                                        },
                                      )..show();
                                    }
                                  } else {
                                    setState(() {
                                      isOTPNotEntered = true;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getSize(12.0), vertical: getSize(30.0)),
                            child: InkWell(
                              onTap: () {
                                if (resendActive && noOfResendClicked < 2) {
                                  if (_timer != null) _timer.cancel();
                                  reSendOTP();
                                  noOfResendClicked += 1;
                                  resendActive = false;
                                  if (noOfResendClicked > 2) {
                                    _timer.cancel();
                                  }
                                  setState(() {});
                                } else if (noOfResendClicked >= 2) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.INFO,
                                    animType: AnimType.TOPSLIDE,
                                    dismissOnTouchOutside: false,
                                    headerAnimationLoop: false,
                                    title: 'INFO',
                                    desc: "You've used max no. of resend otp requests, please try again later.",
                                    btnOkOnPress: () {},
                                  )..show();
                                } else {}
                              },
                              child: Text(
                                "Resend",
                                textAlign: TextAlign.end,
                                style: TextUtils.mediumPoppinsStyle.copyWith(
                                  color: resendActive ? ColorUtils.secondaryColor : Colors.grey,
                                  fontSize: getFontSize(12.0),
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

  sendOTP() async {
    http.Response response = await httpService.sendOtp(
      mobileNumber: widget.mobileNumber,
      clinicId: clinicId,
    );
    if (response.statusCode == 200) {
      SendOTPResponse sendOTPResponse = SendOTPResponse();
      sendOTPResponse.mergeFromBuffer(response.bodyBytes);
      developer.log(sendOTPResponse.toString());
      startTimer();
      if (sendOTPResponse.otpSent) {
        setState(() {});
      } else {
        if (sendOTPResponse.status == "auth_expired") {
          sendOTP();
          return;
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(sendOTPResponse.status),
            btnOkOnPress: () {},
          )..show();
        }
        // navigationService.customAlertDialog(message: 'Some error occured.., please try again later', buttonText: 'Okay');
      }
    }
  }

  void startTimer() {
    _start = 60;
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _start = 00;
            resendActive = true;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  reSendOTP() async {
    http.Response response = await httpService.reSendOtp(
      mobileNumber: widget.mobileNumber,
      clinicId: clinicId,
    );
    if (response.statusCode == 200) {
      ResendOTPResponse resendOTPResponse = ResendOTPResponse();
      resendOTPResponse.mergeFromBuffer(response.bodyBytes);
      developer.log(resendOTPResponse.toString());
      startTimer();
    }
  }

  verifyOTP() async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.verifyOtp(
      mobileNumber: widget.mobileNumber,
      otp: int.tryParse(_otpController.text.toString()),
      clinicId: clinicId,
    );
    LoadingIndicator.dismiss();
    if (response.statusCode == 200) {
      VerifyOTPResponse verifyOTPResponse = VerifyOTPResponse();
      verifyOTPResponse.mergeFromBuffer(response.bodyBytes);
      developer.log(verifyOTPResponse.toString());
      if (verifyOTPResponse.otpVerified) {
        otpVerified = true;
        setState(() {});
      } else {
        if (verifyOTPResponse.status == "auth_expired") {
          verifyOTP();
          return;
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(verifyOTPResponse.status),
            btnOkOnPress: () {},
          )..show();
        }
      }
    }
  }
}
