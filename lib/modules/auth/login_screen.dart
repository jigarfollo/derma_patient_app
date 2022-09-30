import 'dart:collection';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:follo_patient_app/modules/auth/patient_signup_screen.dart';
import 'package:follo_patient_app/modules/auth/signup_screen.dart';
import 'package:follo_patient_app/modules/auth/verify_otp_screen.dart';
import 'package:follo_patient_app/modules/dashboard/widgets/patient_chat_screen.dart';
import 'package:follo_patient_app/modules/home/main_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/common/rounded_text_buttons.dart';
import 'package:follo_patient_app/utils/custom_card.dart';
import 'package:follo_patient_app/utils/decoration_utils.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:local_auth/local_auth.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  static const String route = "login";
  final bool isFromNotification;
  final int folloUpId;
  final String conversationId;

  LoginScreen({Key key, this.isFromNotification = false, this.folloUpId, this.conversationId}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedCountryCode = '+91';

  final TextEditingController _mobileNoController = new TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  String oldTenDigitMobileNo = '';
  bool mobileNoError = false;
  bool _isMobileVerificationStarts = false;
  bool mobileVerified = false;
  bool pinError = false;
  bool autoValidate = false;
  int pinLength = 0;
  FocusNode pinFocusNode = FocusNode();
  final LocalAuthentication localAuthentication = LocalAuthentication();
  PatientPresentResponse patientPresentResponse = PatientPresentResponse();
  HttpService httpService = locator<HttpService>();
  GlobalData globalData = locator<GlobalData>();

  @override
  void initState() {
    mobileVerified = false;
    _isMobileVerificationStarts = false;
    _mobileNoController.text = Preference.shared.getMobileNumber();

    if (_mobileNoController.text.length != 0) {
      checkIfUserPresent();
    } else {
      _mobileNoController.text = "";
    }
    bool isBiometric = Preference.shared.getBool(Preference.isBiometric);
    if (isBiometric) {
      openBioMteric();
    }
    super.initState();
  }

  openBioMteric() async {
    if (await localAuthentication.canCheckBiometrics) {
      bool isAuthenticate = await Authentication.authenticateWithBiometrics();
      if (isAuthenticate) {
        await login(true);
      }
    } else {
      print("no authentication found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primaryColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t Have an Account?',
                style: TextUtils.mediumPoppinsStyle.copyWith(
                  fontSize: getFontSize(12.0),
                  color: ColorUtils.bodyTextColorBlack,
                ),
              ),
              SizedBox(
                width: getSize(10.0),
              ),
              InkWell(
                onTap: () async {
                  NavigationUtilities.pushRoute(
                    SignUpScreen.route,
                  );
                },
                child: Text(
                  'Sign Up',
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
              height: screenHeight(context) * 0.32,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight(context) * 0.05,
                    ),
                    Hero(
                      tag: "tagLogo",
                      child: Image.asset(
                        ImageConstants.logoderma,
                        height: screenHeight(context) * 0.14,
                        width: screenHeight(context) * 0.14,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Login',
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
                        style: TextUtils.mediumPoppinsStyle.copyWith(
                          color: ColorUtils.bodyTextColorWhite,
                          fontSize: getFontSize(10.0),
                        ),
                        textAlign: TextAlign.center,
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
                                              if (value.length >= 0 && value.length != 10) {
                                                if (_pinController != null) {
                                                  _pinController.clear();
                                                }
                                                setState(() {
                                                  mobileNoError = true;
                                                });
                                              } else {
                                                setState(() {
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
                                                  : _isMobileVerificationStarts
                                                      ? CupertinoActivityIndicator()
                                                      : mobileVerified
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
                            height: screenHeight(context) * 0.01,
                          ),
                          Visibility(
                            visible: mobileVerified && !mobileNoError,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PIN',
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
                                    if (_pinController.text.length != 6 || pinError) {
                                      return 'Enter 6 digit pin';
                                    } else {}
                                    return '';
                                  },
                                  onSubmit: (_) {
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                  },
                                  onChanged: (p) {
                                    setState(() {
                                      pinLength = p.length;
                                    });
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
                                  obscureText: '*',
                                  submittedFieldDecoration: DecorationUtils.customBoxDecoration,
                                  selectedFieldDecoration: DecorationUtils.customBoxDecoration,
                                  followingFieldDecoration: DecorationUtils.customBoxDecoration,
                                  pinAnimationType: PinAnimationType.scale,
                                ),
                                SizedBox(
                                  height: screenHeight(context) * 0.02,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      if (_mobileNoController.text.length == 10) {
                                        Map<String, dynamic> dict = HashMap();
                                        dict["mobileNumber"] = selectedCountryCode.toString() + _mobileNoController.text.toString();
                                        NavigationUtilities.pushRoute(
                                          VerifyOTPScreen.route,
                                          args: dict,
                                        );
                                      }
                                    },
                                    child: Text(
                                      'Forgot PIN?',
                                      style: TextUtils.mediumPoppinsStyle.copyWith(
                                        color: ColorUtils.secondaryColor,
                                        fontSize: getFontSize(12.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: mobileVerified && pinLength == 6 && !mobileNoError,
                            child: SizedBox(
                              height: screenHeight(context) * 0.02,
                            ),
                          ),
                          Visibility(
                            visible: mobileVerified && pinLength == 6 && !mobileNoError,
                            child: RoundedTextButton(
                              text: 'Login',
                              onPressed: () async {
                                if (_mobileNoController.text.length != 10) {
                                  mobileNoError = true;
                                } else {
                                  mobileNoError = false;
                                }
                                if (_pinController.text.length != 6) {
                                  pinError = true;
                                } else {
                                  pinError = false;
                                }
                                setState(() {});
                                print('patientPresentResponse for patient:-');
                                print(patientPresentResponse.userPresent.toString());
                                if (mobileNoError || pinError) {
                                  return;
                                } else if (patientPresentResponse.userPresent != null && patientPresentResponse.userPresent == true) {
                                  await login(false);
                                }
                              },
                            ),
                          ),
                          if (mobileVerified)
                            Center(
                              child: Text(
                                'OR',
                                style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                  color: ColorUtils.primaryColor,
                                  fontSize: getFontSize(12.0),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          if (mobileVerified)
                            InkWell(
                              onTap: () async {
                                bool isAuthenticated = await Authentication.authenticateWithBiometrics();
                                if (isAuthenticated) {
                                  await login(true);
                                } else {
                                  print('authenticate failure');
                                }
                              },
                              child: Center(
                                child: Image.asset(
                                  Platform.isAndroid ? ImageConstants.fingerIcon : ImageConstants.faceIcon,
                                  height: getSize(52),
                                  width: getSize(52),
                                  color: ColorUtils.primaryColor,
                                ),
                              ),
                            )
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

  checkIfUserPresent() async {
    try {
      _isMobileVerificationStarts = true;

      http.Response response = await httpService.userPresent(
        mobileNumber: (selectedCountryCode.toString() + _mobileNoController.text.toString()),
        clinicId: clinicId,
      );
      if (response.statusCode == 200) {
        patientPresentResponse.clear();
        patientPresentResponse.mergeFromBuffer(response.bodyBytes);
        print(patientPresentResponse.toString());
        developer.log('response code is 200');
        if (patientPresentResponse.userPresent != null && patientPresentResponse.userPresent) {
          if (patientPresentResponse.userType.toString().toLowerCase() == "patient") {
            Preference.shared.setMobileNumber(_mobileNoController.text.toString());
            setState(() {
              mobileVerified = true;
              _isMobileVerificationStarts = false;
            });
          } else {
            FocusScope.of(context).unfocus();
            pinFocusNode.requestFocus();
            setState(() {
              mobileVerified = true;
              _isMobileVerificationStarts = false;
            });
          }
        } else {
          setState(() {
            _mobileNoController.clear();
            mobileVerified = false;
            _isMobileVerificationStarts = false;
          });
          AwesomeDialog(
            dismissOnBackKeyPress: false,
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: "You're not registered on the platform, please sign up.",
            btnOkOnPress: () {
              Preference.shared.setMobileNumber("");
              NavigationUtilities.pushRoute(
                SignUpScreen.route,
              );
            },
          )..show();
        }
      } else {
        setState(() {
          mobileVerified = false;
          _isMobileVerificationStarts = false;
        });
        developer.log('response code not 200');
      }
    } catch (e) {
      setState(() {
        mobileVerified = false;
        _isMobileVerificationStarts = false;
      });
    }
  }

  login(bool userBioMetric) async {
    LoadingIndicator.show(context);

    http.Response response = await httpService.login(
      mobileNumber: (selectedCountryCode.toString() + _mobileNoController.text.toString()),
      pin: !userBioMetric ? int.parse(_pinController.text) : 0,
      userBiometric: userBioMetric,
      clinicId: clinicId,
    );
    LoadingIndicator.dismiss();

    if (response.statusCode == 200) {
      PatientAuthenticateResponse authenticate = PatientAuthenticateResponse();
      authenticate.mergeFromBuffer(response.bodyBytes);
      developer.log(authenticate.toString());
      if (authenticate.authenticated) {
        globalData.setUserToken(userToken: authenticate.userToken);
        globalData.setUserType(userType: authenticate.userType);
        globalData.setUserId(userId: authenticate.userId);
        if (userBioMetric) {
          await Preference.shared.setBool(Preference.isBiometric, true);
        }

        if (!authenticate.signUpDetails) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'Info',
            desc: 'Please fill out necessary details for login, Press Okay button to go further',
            btnOkOnPress: () {
              Map<String, dynamic> dict = HashMap();
              dict["mobileNumber"] = selectedCountryCode.toString() + _mobileNoController.text.toString();
              NavigationUtilities.pushReplacementNamed(
                PatientSignupScreen.route,
                args: dict,
              );
            },
          )..show();
        } else {
          if (patientPresentResponse.userPresent && authenticate.userType == 'patient') {
            Preference.shared.setIsUserLoggedIn(true);
            Preference.shared.setUserToken(authenticate.userToken);
            Preference.shared.setUserId(authenticate.userId);
            Preference.shared.setUserType(authenticate.userType);
            Preference.shared.setMobileNumber(_mobileNoController.text.toString());

            String isUserReportForNotification = Preference.shared.getPlayerId();

            // If playreId is null then ask for permisssion
            if (isUserReportForNotification.toString() == "") {
              if (Platform.isIOS) {
                OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
                  print("Accepted permission: $accepted");
                  LoadingIndicator.show(context);
                  OneSignal.shared.getDeviceState().then((deviceState) async {
                    print("DeviceState: ${deviceState?.jsonRepresentation()}");
                    LoadingIndicator.dismiss();
                    initialSubscriptionApiCall(playerId: deviceState.userId, isSUbscribed: deviceState.hasNotificationPermission);
                    await Preference.shared.setPlayerId(deviceState.userId ?? "");
                  });
                });
              } else {
                LoadingIndicator.show(context);
                OneSignal.shared.getDeviceState().then((deviceState) async {
                  print("DeviceState: ${deviceState?.jsonRepresentation()}");
                  LoadingIndicator.dismiss();
                  initialSubscriptionApiCall(playerId: deviceState.userId, isSUbscribed: deviceState.hasNotificationPermission);
                  await Preference.shared.setPlayerId(deviceState.userId ?? "");
                  print(Preference.shared.getPlayerId());
                });
              }
            } else {
              await Preference.shared.setBool(Preference.shouldRouteFromNotification, true);
              Map<String, dynamic> dict = HashMap();

              if (widget.isFromNotification) {
                dict["folloUpId"] = widget.folloUpId;
                dict["conversationId"] = widget.conversationId.toString();
                dict["isFromNotification"] = widget.isFromNotification;
                dict["enableOptions"] = true;

                NavigationUtilities.pushReplacementNamed(
                  PatientChatScreen.route,
                  args: dict,
                );
              } else {
                dict["isFromLogin"] = true;
                NavigationUtilities.pushReplacementNamed(
                  MainScreen.route,
                  args: dict,
                );
              }

              print("user already subscribed for notification");
            }
          } else if (patientPresentResponse.userPresent && patientPresentResponse.userType == "unknown") {
            Map<String, dynamic> dict = HashMap();
            dict["mobileNumber"] = selectedCountryCode.toString() + _mobileNoController.text.toString();
            NavigationUtilities.pushReplacementNamed(
              PatientSignupScreen.route,
              args: dict,
            );
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.TOPSLIDE,
              dismissOnTouchOutside: false,
              headerAnimationLoop: false,
              title: 'ERROR',
              desc: 'Some error occurred, Please try again later.',
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
          desc: "You've entered wrong pin, please try again.",
          btnOkOnPress: () {
            _pinController.clear();
          },
        )..show();
      }
    } else {
      developer.log('response code not 200');
    }
  }

  initialSubscriptionApiCall({String playerId, bool isSUbscribed}) async {
    LoadingIndicator.show(context);

    http.Response response = await httpService.initialSubscription(
      userToken: globalData.userToken,
      userId: globalData.userId,
      playerId: playerId ?? "",
      subscribed: isSUbscribed,
      clinicId: clinicId,
    );
    print(response.toString());
    LoadingIndicator.dismiss();
    print("InitialSubscription api Status code: " + response.statusCode.toString());
    if (response.statusCode == 200) {
      InitialSubscriptionResponse initialSubscriptionResponse = InitialSubscriptionResponse();
      initialSubscriptionResponse.mergeFromBuffer(response.bodyBytes);
      print(initialSubscriptionResponse.status.toString());
      await currentNotificationStatusApiCall();
    } else {
      return;
    }
  }

  currentNotificationStatusApiCall() async {
    LoadingIndicator.show(context);
    String fethcedPlayerId = Preference.shared.getPlayerId();

    http.Response response = await httpService.currentNotificationStatus(
      userToken: globalData.userToken,
      userId: globalData.userId,
      playerId: fethcedPlayerId,
      clinicId: clinicId,
    );
    LoadingIndicator.dismiss();

    print("InitialSubscription api Status code: " + response.statusCode.toString());

    if (response.statusCode == 200) {
      CurrentNotificationStatusResponse currentNotificationStatusResponse = CurrentNotificationStatusResponse();
      currentNotificationStatusResponse.mergeFromBuffer(response.bodyBytes);
      print(currentNotificationStatusResponse.toString());
      print('response code is 200');
      print("currentNotificationStatus status : " + currentNotificationStatusResponse.status.toString());
      print("subscribed status:   " + currentNotificationStatusResponse.subscribed.toString());
      print("Patient Critical Alert :   " + currentNotificationStatusResponse.patientCriticalAlert.toString());
      print("Patient Message Chat :   " + currentNotificationStatusResponse.patientMessageChat.toString());

      // Set all notification status values to preference
      await Preference.shared.setBool(Preference.subscribed, currentNotificationStatusResponse.subscribed);
      await Preference.shared.setBool(Preference.patientCriticalAlert, currentNotificationStatusResponse.patientCriticalAlert);
      await Preference.shared.setBool(Preference.patientMessageChat, currentNotificationStatusResponse.patientMessageChat);

      Map<String, dynamic> dict = HashMap();
      dict["isFromLogin"] = true;

      await Preference.shared.setBool(Preference.shouldRouteFromNotification, true);
      if (widget.isFromNotification) {
        dict["folloUpId"] = widget.folloUpId;
        dict["conversationId"] = widget.conversationId.toString();
        dict["isFromNotification"] = widget.isFromNotification;
        dict["enableOptions"] = true;

        NavigationUtilities.pushReplacementNamed(
          PatientChatScreen.route,
          args: dict,
        );
      } else {
        dict["isFromLogin"] = true;

        NavigationUtilities.pushReplacementNamed(
          MainScreen.route,
          args: dict,
        );
      }
    } else {
      print('response code not 200');
      print(response.bodyBytes.toString());
    }
  }
}

class Authentication {
  static Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
        biometricOnly: true,
        localizedReason: 'Please complete the biometrics to proceed.',
      );
    }

    return isAuthenticated;
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
