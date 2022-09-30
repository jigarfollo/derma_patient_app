import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/common/rounded_text_buttons.dart';
import 'package:follo_patient_app/utils/decoration_utils.dart';
import 'package:follo_patient_app/utils/error_handler.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

class ResetPINScreen extends StatefulWidget {
  static const String route = "ResetPINScreen";
  final String mobileNumber;
  final int otp;

  ResetPINScreen({@required this.mobileNumber, @required this.otp});

  @override
  _ResetPINScreenState createState() => _ResetPINScreenState();
}

class _ResetPINScreenState extends State<ResetPINScreen> {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _confirmPINController = TextEditingController();
  HttpService httpService = locator<HttpService>();

  bool pinError = false;
  bool pinMisMatch = false;

  FocusNode pinFocusNode = FocusNode();
  FocusNode confirmPINFocusNode = FocusNode();

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
                        'Set New PIN',
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
                      padding: EdgeInsets.all(screenHeight(context) * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New PIN',
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
                          Column(
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
                                  } else if (_pinController.text.toString() != _confirmPINController.text.toString()) {
                                    return 'PIN does not match';
                                  }
                                  return '';
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
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getSize(40.0)),
                            child: Hero(
                              tag: "tagAuthButton",
                              child: RoundedTextButton(
                                text: 'Done',
                                onPressed: () async {
                                  if (_pinController.text.length == 6 &&
                                      _confirmPINController.text.length == 6 &&
                                      _pinController.text.toString() == _confirmPINController.text.toString()) {
                                    await setPin();
                                  } else {
                                    return 'Invalid pin';
                                  }
                                },
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

  setPin() async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.setPin(
      mobileNumber: widget.mobileNumber,
      otp: widget.otp,
      pin: int.tryParse(_pinController.text.toString()),
      clinicId: clinicId,
    );
    print(response.toString());
    LoadingIndicator.dismiss();
    if (response.statusCode == 200) {
      SetPinResponse setPinResponse = SetPinResponse();
      setPinResponse.mergeFromBuffer(response.bodyBytes);
      developer.log(setPinResponse.toString());
      print("Pin set for mobile number " + setPinResponse.mobileNumber.toString());
      print("Pin set status " + setPinResponse.pinSet.toString());
      print(setPinResponse.toString());
      if (setPinResponse.pinSet) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.TOPSLIDE,
          dismissOnTouchOutside: false,
          headerAnimationLoop: false,
          title: 'SUCCESS',
          desc: "Your PIN has been reset successfully.",
          btnOkOnPress: () {
            Navigator.of(context).pop();
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
      }
    } else {
      developer.log('response code not 200');
    }
  }
}
