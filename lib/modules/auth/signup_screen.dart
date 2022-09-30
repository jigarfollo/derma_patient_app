import 'dart:async';
import 'dart:collection';
import 'dart:developer' as developer;
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:follo_patient_app/modules/auth/login_screen.dart';
import 'package:follo_patient_app/modules/auth/patient_signup_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/common/rounded_text_buttons.dart';
import 'package:follo_patient_app/utils/custom_card.dart';
import 'package:follo_patient_app/utils/decoration_utils.dart';
import 'package:follo_patient_app/utils/error_handler.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pin_put/pin_put.dart';

class SignUpScreen extends StatefulWidget {
  static const String route = "signUp";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _mobileNoController = new TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _confirmPINController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  HttpService httpService = locator<HttpService>();
  PatientPresentResponse userPresentResponse = PatientPresentResponse();
  GlobalData globalData = locator<GlobalData>();

  String selectedCountryCode = '+91';
  String oldTenDigitMobileNo = '';

  bool autoValidate = false;
  bool pinError = false;
  int oldOTP;
  bool _isOTPVisible = false;
  bool _isOTPSent = false;
  bool _isPINVisible = false;
  bool mobileNoError = false;
  bool _isSendingOTP = false;
  bool pinMisMatch = false;

  FocusNode pinFocusNode = FocusNode();
  FocusNode confirmPINFocusNode = FocusNode();
  FocusNode otpFocusNode = FocusNode();

  // timer
  Timer _timer;
  int _start;
  bool resendActive = false;
  int noOfResendClicked = 0;

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
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
                'Already Have an Account?',
                style: TextUtils.mediumPoppinsStyle.copyWith(
                  fontSize: getFontSize(12.0),
                  color: ColorUtils.bodyTextColorBlack,
                ),
              ),
              SizedBox(
                width: getSize(10.0),
              ),
              InkWell(
                onTap: () {
                  NavigationUtilities.pushReplacementNamed(
                    LoginScreen.route,
                  );
                },
                child: Text(
                  'Login',
                  style: TextUtils.boldPoppinsStyle.copyWith(
                    fontSize: getFontSize(12.0),
                    color: ColorUtils.secondaryColor,
                  ),
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
              height: screenHeight(context) * 0.2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight(context) * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Sign Up',
                        style: TextUtils.semiBoldPoppinsStyle.copyWith(
                          color: ColorUtils.titleTextColorWhite,
                          fontSize: getFontSize(24.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Text(
                        'to ensure enhanced patient care continuity',
                        style: TextUtils.lightPoppinsStyle.copyWith(
                          color: ColorUtils.bodyTextColorWhite,
                          fontSize: getFontSize(10.0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.03,
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
                  SingleChildScrollView(
                    reverse: _keyboardIsVisible() ? true : false,
                    padding: _keyboardIsVisible() ? EdgeInsets.only(bottom: 40) : EdgeInsets.all(0),
                    child: Container(
                      width: screenWidth(context),
                      child: Padding(
                        padding: EdgeInsets.all(screenHeight(context) * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Hero(
                              tag: "tagAuthMobileNumber",
                              child: Material(
                                type: MaterialType.transparency,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mobile number',
                                      style: TextUtils.regularPoppinsStyle.copyWith(
                                        fontSize: getFontSize(12.0),
                                        color: ColorUtils.bodyTextColorBlack,
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight(context) * 0.01,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: ColorUtils.cardBorderColor,
                                              width: getSize(1.0),
                                            ),
                                            borderRadius: BorderRadius.circular(getSize(8.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                                blurRadius: getSize(30),
                                                offset: Offset(
                                                  getSize(2),
                                                  getSize(10),
                                                ),
                                              ), // Shadow according to web app XD
                                            ],
                                          ),
                                          child: Center(
                                            child: CountryPickerDropdown(
                                              initialValue: 'IN',
                                              itemBuilder: _buildDropdownItem,
                                              iconEnabledColor: Colors.grey,
                                              selectedItemBuilder: (Country country) {
                                                return Center(
                                                  child: Container(
                                                    width: screenWidth(context) * 0.22,
                                                    child: Center(
                                                      child: Text(
                                                        "+ " + country.phoneCode,
                                                        style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                                          fontSize: getFontSize(14),
                                                          color: ColorUtils.titleTextColorBlack,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              itemFilter: null,
                                              priorityList: [
                                                CountryPickerUtils.getCountryByIsoCode('IN'),
                                                CountryPickerUtils.getCountryByIsoCode('US'),
                                              ],
                                              sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                                              onValuePicked: (Country country) {
                                                selectedCountryCode = '+' + country.phoneCode;
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: getSize(5.0),
                                        ),
                                        Expanded(
                                          child: CustomCard(
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Please Enter WhatsApp Number';
                                                }
                                                return null;
                                              },
                                              controller: _mobileNoController,
                                              readOnly: false,
                                              onChanged: (String value) async {
                                                if (value.length > 0 && value.length != 10) {
                                                  setState(() {
                                                    mobileNoError = true;
                                                    _isPINVisible = false;
                                                    _isOTPVisible = false;
                                                    _isOTPSent = false;
                                                    _otpController.clear();
                                                    _timer?.cancel();
                                                  });
                                                } else {
                                                  setState(() {
                                                    _isOTPSent = false;
                                                    mobileNoError = false;
                                                  });
                                                }
                                                if (value.length == 10) {
                                                  if (value.toString() != oldTenDigitMobileNo) {
                                                    oldTenDigitMobileNo = value;
                                                    await checkIfUserPresent();
                                                  }
                                                }
                                              },
                                              maxLength: 10,
                                              autovalidateMode: AutovalidateMode.onUserInteraction,
                                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                              textAlign: TextAlign.start,
                                              style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                                fontSize: getFontSize(14.0),
                                              ),
                                              decoration: DecorationUtils.customInputDecoration.copyWith(
                                                suffixIcon: mobileNoError
                                                    ? Icon(
                                                        Icons.error,
                                                        color: Colors.red,
                                                        size: getSize(24),
                                                      )
                                                    : _isSendingOTP
                                                        ? CupertinoActivityIndicator()
                                                        : _isOTPSent
                                                            ? Padding(
                                                                padding: EdgeInsets.all(getSize(16)),
                                                                child: Image.asset(
                                                                  ImageConstants.imageVerified,
                                                                  height: getSize(20),
                                                                  width: getSize(20),
                                                                ),
                                                              )
                                                            : SizedBox(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight(context) * 0.03,
                            ),
                            Visibility(
                              visible: _isOTPVisible,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'OTP',
                                    style: TextUtils.regularPoppinsStyle.copyWith(
                                      fontSize: getFontSize(12.0),
                                      color: ColorUtils.bodyTextColorBlack,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight(context) * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: screenWidth(context) * 0.59,
                                        child: PinPut(
                                          onChanged: (String value) {
                                            if (_otpController.text.length == 4) {
                                              if (oldOTP == null) {
                                                oldOTP = int.parse(_otpController.text);
                                                verifyOTP();
                                              } else if (int.parse(_otpController.text) != oldOTP) {
                                                oldOTP = int.parse(_otpController.text);
                                                verifyOTP();
                                              }
                                            }
                                          },
                                          onSubmit: (_) {
                                            FocusScope.of(context).requestFocus(new FocusNode());
                                          },
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          withCursor: true,
                                          fieldsCount: 4,
                                          focusNode: otpFocusNode,
                                          textStyle: TextUtils.semiBoldPoppinsStyle.copyWith(
                                            color: Colors.grey,
                                            fontSize: getFontSize(14),
                                          ),
                                          eachFieldMargin: EdgeInsets.all(0),
                                          eachFieldWidth: getSize(46.0),
                                          eachFieldHeight: getSize(46.0),
                                          controller: _otpController,
                                          submittedFieldDecoration: DecorationUtils.customBoxDecoration,
                                          selectedFieldDecoration: DecorationUtils.customBoxDecoration,
                                          followingFieldDecoration: DecorationUtils.customBoxDecoration,
                                          pinAnimationType: PinAnimationType.scale,
                                        ),
                                      ),
                                      Visibility(
                                        visible: !_isPINVisible,
                                        child: Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              _start != null
                                                  ? Text(
                                                      '00:' + _start.toString().padLeft(2, '0'),
                                                      style: TextUtils.regularPoppinsStyle
                                                          .copyWith(fontSize: getFontSize(10), color: ColorUtils.bodyTextColorBlack),
                                                    )
                                                  : SizedBox(height: 20),
                                              InkWell(
                                                onTap: () {
                                                  if (resendActive && noOfResendClicked < 2) {
                                                    if (_timer != null) _timer.cancel();
                                                    // reSendOTP();
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight(context) * 0.03,
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _isPINVisible,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Set PIN',
                                    style: TextUtils.regularPoppinsStyle.copyWith(
                                      fontSize: getFontSize(12.0),
                                      color: ColorUtils.bodyTextColorBlack,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight(context) * 0.01,
                                  ),
                                  PinPut(
                                    validator: (s) {
                                      if (_pinController.text.length != 6) {
                                        return 'Enter 6 digit pin';
                                      } else if (pinError) {
                                        return 'does not match';
                                      }
                                      return '';
                                    },
                                    onSubmit: (_) {
                                      FocusScope.of(context).requestFocus(new FocusNode());
                                    },
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    withCursor: true,
                                    fieldsCount: 6,
                                    focusNode: pinFocusNode,
                                    textStyle: TextUtils.semiBoldPoppinsStyle.copyWith(
                                      color: Colors.grey,
                                      fontSize: getFontSize(14),
                                    ),
                                    eachFieldMargin: EdgeInsets.all(0),
                                    eachFieldWidth: getSize(46.0),
                                    eachFieldHeight: getSize(46.0),
                                    controller: _pinController,
                                    submittedFieldDecoration: DecorationUtils.customBoxDecoration,
                                    selectedFieldDecoration: DecorationUtils.customBoxDecoration,
                                    followingFieldDecoration: DecorationUtils.customBoxDecoration,
                                    pinAnimationType: PinAnimationType.scale,
                                  ),
                                  SizedBox(
                                    height: screenHeight(context) * 0.03,
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _isPINVisible,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Confirm PIN',
                                    style: TextUtils.regularPoppinsStyle.copyWith(
                                      fontSize: getFontSize(12.0),
                                      color: ColorUtils.bodyTextColorBlack,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight(context) * 0.01,
                                  ),
                                  PinPut(
                                    validator: (s) {
                                      if (_confirmPINController.text.length != 6) {
                                        return 'Enter 6 digit pin';
                                      } else if (pinMisMatch) {
                                        return 'PIN does not match';
                                      }
                                      return '';
                                    },
                                    onSubmit: (_) {
                                      FocusScope.of(context).requestFocus(new FocusNode());
                                    },
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    withCursor: true,
                                    fieldsCount: 6,
                                    focusNode: confirmPINFocusNode,
                                    textStyle: TextUtils.semiBoldPoppinsStyle.copyWith(
                                      color: Colors.grey,
                                      fontSize: getFontSize(14),
                                    ),
                                    eachFieldMargin: EdgeInsets.all(0),
                                    eachFieldWidth: getSize(46.0),
                                    eachFieldHeight: getSize(46.0),
                                    controller: _confirmPINController,
                                    obscureText: '*',
                                    submittedFieldDecoration: DecorationUtils.customBoxDecoration,
                                    selectedFieldDecoration: DecorationUtils.customBoxDecoration,
                                    followingFieldDecoration: DecorationUtils.customBoxDecoration,
                                    pinAnimationType: PinAnimationType.scale,
                                  ),
                                  SizedBox(
                                    height: screenHeight(context) * 0.04,
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _isPINVisible &&
                                  _mobileNoController.text.length == 10 &&
                                  _otpController.text.length == 4 &&
                                  _confirmPINController.text.length == 6 &&
                                  _pinController.text.length == 6 &&
                                  _pinController.text == _confirmPINController.text,
                              child: Hero(
                                tag: "tagAuthButton",
                                child: RoundedTextButton(
                                  text: 'Sign Up',
                                  onPressed: () async {
                                    if (_mobileNoController.text.length != 10) {
                                      mobileNoError = true;
                                    } else {
                                      mobileNoError = false;
                                    }
                                    if (_pinController.text.length != 6 ||
                                        _confirmPINController.text.length != 6 ||
                                        _pinController.text != _confirmPINController.text) {
                                      pinMisMatch = true;
                                    } else {
                                      pinMisMatch = false;
                                    }

                                    if (mobileNoError || pinMisMatch) {
                                      return;
                                    } else if (userPresentResponse.userPresent != null && userPresentResponse.userPresent == false) {
                                      await setPin();
                                    }
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight(context) * 0.03,
                            ),
                          ],
                        ),
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

  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  checkIfUserPresent() async {
    _isSendingOTP = true;
    http.Response response = await httpService.userPresent(
      mobileNumber: (selectedCountryCode.toString() + _mobileNoController.text.toString()),
      clinicId: clinicId,
    );
    if (response.statusCode == 200) {
      userPresentResponse.mergeFromBuffer(response.bodyBytes);
      developer.log(userPresentResponse.toString());
      if (userPresentResponse.userPresent != null && userPresentResponse.userPresent) {
        _isOTPVisible = false;
        _isSendingOTP = false;
        setState(() {});
        AwesomeDialog(
          dismissOnBackKeyPress: false,
          context: context,
          dialogType: DialogType.INFO,
          animType: AnimType.TOPSLIDE,
          dismissOnTouchOutside: false,
          headerAnimationLoop: false,
          title: 'INFO',
          desc: 'User already exists. Please try to login.',
          btnOkOnPress: () {
            NavigationUtilities.pushRoute(
              LoginScreen.route,
            );
          },
        )..show();
      } else {
        sendOTP();
      }
    } else {
      setState(() {
        _isSendingOTP = false;
        _mobileNoController.clear();
      });
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.TOPSLIDE,
        dismissOnTouchOutside: false,
        headerAnimationLoop: false,
        title: 'ERROR',
        desc: ErrorHandler().getErrorMessage(userPresentResponse.status),
        btnOkOnPress: () {},
      )..show();
    }
  }

  sendOTP() async {
    http.Response response = await httpService.sendOtp(
      mobileNumber: (selectedCountryCode.toString() + _mobileNoController.text.toString()),
      clinicId: clinicId,
    );
    if (response.statusCode == 200) {
      SendOTPResponse sendOTPResponse = SendOTPResponse();
      sendOTPResponse.mergeFromBuffer(response.bodyBytes);
      developer.log(sendOTPResponse.toString());
      startTimer();
      if (sendOTPResponse.otpSent) {
        _isOTPVisible = true;
        _isOTPSent = true;
        _isSendingOTP = false;
        setState(() {});
      } else {
        if (sendOTPResponse.status == "auth_expired") {
          sendOTP();
          return;
        } else {
          _isSendingOTP = false;
          setState(() {});
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
      }
    } else {
      setState(() {
        _isSendingOTP = false;
        _mobileNoController.clear();
      });
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.TOPSLIDE,
        dismissOnTouchOutside: false,
        headerAnimationLoop: false,
        title: 'ERROR',
        desc: 'Some error occurred.., please try again later',
        btnOkOnPress: () {},
      )..show();
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
      mobileNumber: (selectedCountryCode.toString() + _mobileNoController.text.toString()),
      clinicId: clinicId,
    );
    if (response.statusCode == 200) {
      ResendOTPResponse resendOTPResponse = ResendOTPResponse();
      resendOTPResponse.mergeFromBuffer(response.bodyBytes);
      developer.log(resendOTPResponse.toString());
      startTimer();
    } else {}
  }

  verifyOTP() async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.verifyOtp(
      mobileNumber: (selectedCountryCode.toString() + _mobileNoController.text.toString()),
      otp: int.parse(_otpController.text),
      clinicId: clinicId,
    );
    LoadingIndicator.dismiss();
    if (response.statusCode == 200) {
      VerifyOTPResponse verifyOTPResponse = VerifyOTPResponse();
      verifyOTPResponse.mergeFromBuffer(response.bodyBytes);
      developer.log(verifyOTPResponse.toString());
      if (verifyOTPResponse.otpVerified) {
        _isPINVisible = true;
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
            desc: "You've entered wrong OTP. Please try again.",
            btnOkOnPress: () {},
          )..show();
        }
      }
    } else {}
  }

  setPin() async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.setPin(
      mobileNumber: (selectedCountryCode.toString() + _mobileNoController.text.toString()),
      otp: int.parse(_otpController.text.toString()),
      pin: int.parse(_confirmPINController.text.toString()),
      clinicId: clinicId,
    );
    LoadingIndicator.dismiss();
    if (response.statusCode == 200) {
      SetPinResponse setPinResponse = SetPinResponse();
      setPinResponse.mergeFromBuffer(response.bodyBytes);
      developer.log(setPinResponse.toString());
      setState(() {});
      if (setPinResponse.pinSet) {
        Map<String, dynamic> dict = HashMap();
        dict["mobileNumber"] = selectedCountryCode.toString() + _mobileNoController.text.toString();
        dict["isForEdit"] = false;
        globalData.setUserToken(userToken: setPinResponse.userToken);
        globalData.setUserId(userId: setPinResponse.userId);
        AwesomeDialog(
          dismissOnBackKeyPress: false,
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.TOPSLIDE,
          dismissOnTouchOutside: false,
          headerAnimationLoop: false,
          title: 'SUCCESS',
          desc: "Congratulations! Sign up successful. Please proceed further to create profile.",
          btnOkOnPress: () async {
            NavigationUtilities.pushReplacementNamed(
              PatientSignupScreen.route,
              args: dict,
            );
          },
        )..show();
      } else {
        if (setPinResponse.status == "auth_expired") {
          setPin();
          return;
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(setPinResponse.status),
            btnOkOnPress: () {},
          )..show();
        }
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.TOPSLIDE,
          dismissOnTouchOutside: false,
          headerAnimationLoop: false,
          title: 'ERROR',
          desc: 'Some error occurred, please try again later.',
          btnOkOnPress: () {},
        )..show();
      }
    } else {
      developer.log('response code not 200');
    }
  }
}

Widget _buildDropdownItem(Country country) => Container(
      width: 300,
      child: Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            width: 4.0,
          ),
          Text("+${country.phoneCode}"),
        ],
      ),
    );
