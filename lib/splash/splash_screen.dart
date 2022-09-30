import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/auth/login_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:follo_patient_app/utils/widgets/bouncy_button.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  static const String route = "splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  GlobalData globalData = locator<GlobalData>();
  HttpService httpService = locator<HttpService>();
  AnimationController _logoAnimationController;
  AnimationController _bgAnimationController;
  Tween<double> _logoTween = Tween(begin: 0, end: 2);
  Tween<double> _bgTween = Tween(begin: 1, end: 1.5);
  bool isDataFetching = false;

  @override
  void initState() {
    super.initState();
    _logoAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _bgAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 10))..forward().whenComplete(() => _bgAnimationController.reverse());
    Future.delayed(Duration(milliseconds: 700), () {
      _logoAnimationController.forward(from: 0.0);
    });
    checkVersion();
  }

  goToNextFlow() {
    Timer(Duration(seconds: 2), () {
      NavigationUtilities.pushReplacementNamed(
        LoginScreen.route,
      );
    });
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    _bgAnimationController.dispose();
    super.dispose();
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScaleTransition(
          scale: _bgTween.animate(CurvedAnimation(parent: _bgAnimationController, curve: Curves.easeIn)),
          child: Image.asset(
            ImageConstants.loginIMG,
            fit: BoxFit.cover,
            height: screenHeight(context),
          ),
        ),
        Container(
          color: ColorUtils.getColorFromHex("CC${ColorUtils.primaryColorString}"),
        ),
        ScaleTransition(
          scale: _logoTween.animate(CurvedAnimation(parent: _logoAnimationController, curve: Curves.elasticOut)),
          child: Center(
            child: Hero(
              tag: "tagLogo",
              child: Image.asset(
                ImageConstants.logoderma,
                // ImageConstants.logoOmni,
                height: screenWidth(context) * 0.2,
                width: screenWidth(context) * 0.2,
                // color: Colors.white,
              ),
            ),
          ),
        ),
        Visibility(
          visible: isDataFetching,
          child: Padding(
            padding: EdgeInsets.only(bottom: screenHeight(context) * 0.1),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoTheme(
                    data: CupertinoTheme.of(context).copyWith(brightness: Brightness.dark),
                    child: CupertinoActivityIndicator(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      "Please wait while we are fetching latest data for you.",
                      style: TextUtils.regularPoppinsStyle.copyWith(
                        fontSize: getFontSize(11),
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  checkVersion() async {
    LoadingIndicator.show(context);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    http.Response response = await httpService.versioningCheck(
      userId: Preference.shared.getUserId(),
      userToken: Preference.shared.getUserToken(),
      versionNumber: packageInfo.version,
      clinicId: clinicId,
    );
    LoadingIndicator.dismiss();
    if (response.statusCode == 200) {
      VersionResponse versionResponse = VersionResponse();
      versionResponse.mergeFromBuffer(response.bodyBytes);
      developer.log(versionResponse.toString());
      if (versionResponse.status == "maintenance") {
        print("under maintanance");
        await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        ImageConstants.logoBackgroungImage,
                        width: screenHeight(context) * 0.1,
                      ),
                      SizedBox(
                        height: screenWidth(context) * 0.03,
                      ),
                      Text(
                        "Attention!",
                        textAlign: TextAlign.center,
                        style: TextUtils.semiBoldPoppinsStyle.copyWith(fontSize: getFontSize(14)),
                      ),
                      SizedBox(
                        height: screenWidth(context) * 0.01,
                      ),
                      Text(
                        "Sorry! App or Platform is under maintenance, Please close the app and try again later.",
                        textAlign: TextAlign.center,
                        style: TextUtils.regularPoppinsStyle.copyWith(fontSize: getFontSize(12)),
                      ),
                      SizedBox(
                        height: screenWidth(context) * 0.02,
                      ),
                    ],
                  ),
                ),
              );
            });
      } else if (versionResponse.status == "force_update") {
        print("force update");
        await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        ImageConstants.logoBackgroungImage,
                        width: screenHeight(context) * 0.1,
                      ),
                      SizedBox(
                        height: screenWidth(context) * 0.03,
                      ),
                      Text(
                        "Attention!",
                        textAlign: TextAlign.center,
                        style: TextUtils.semiBoldPoppinsStyle.copyWith(fontSize: getFontSize(14)),
                      ),
                      SizedBox(
                        height: screenWidth(context) * 0.01,
                      ),
                      Text(
                        "You are using the old version of Derma Cares app which is not compatible with newly added features or improvements. Please update Derma Cares app to the latest version available.",
                        textAlign: TextAlign.center,
                        style: TextUtils.regularPoppinsStyle.copyWith(fontSize: getFontSize(12)),
                      ),
                      SizedBox(
                        height: screenWidth(context) * 0.03,
                      ),
                      BouncyButton(
                        onPressed: () async {
                          if (Platform.isAndroid) {
                            launchURL("https://play.google.com/store/apps/details?id=com.folloplatforms.derma.patient");
                          } else if (Platform.isIOS) {
                            launchURL("https://apps.apple.com/in/app/derma/id1571028976");
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: screenWidth(context) * 0.65,
                          height: screenWidth(context) * 0.1,
                          decoration: BoxDecoration(
                            color: ColorUtils.primaryColor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: ColorUtils.primaryColor.withOpacity(0.5),
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            "Update",
                            style: TextUtils.semiBoldPoppinsStyle.copyWith(color: Colors.white, fontSize: getFontSize(14)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      } else if (versionResponse.status == "minor_update") {
        print("minor update");
        await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        ImageConstants.logoBackgroungImage,
                        width: screenHeight(context) * 0.1,
                      ),
                      SizedBox(
                        height: screenWidth(context) * 0.03,
                      ),
                      Text(
                        "Information!",
                        textAlign: TextAlign.center,
                        style: TextUtils.semiBoldPoppinsStyle.copyWith(fontSize: getFontSize(14)),
                      ),
                      SizedBox(
                        height: screenWidth(context) * 0.01,
                      ),
                      Text(
                        "New version of Derma Cares App is available, please update app by clicking on Update button here or you can continue also by clicking on Button below",
                        textAlign: TextAlign.center,
                        style: TextUtils.regularPoppinsStyle.copyWith(fontSize: getFontSize(12)),
                      ),
                      SizedBox(
                        height: screenWidth(context) * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BouncyButton(
                            onPressed: () {
                              if (Platform.isAndroid) {
                                launchURL("https://play.google.com/store/apps/details?id=com.folloplatforms.derma.patient");
                              } else if (Platform.isIOS) {
                                launchURL("https://apps.apple.com/in/app/derma/id1571028976");
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: screenWidth(context) * 0.3,
                              height: screenWidth(context) * 0.1,
                              decoration: BoxDecoration(
                                color: ColorUtils.dropdownColor,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(
                                "Update",
                                style: TextUtils.semiBoldPoppinsStyle,
                              ),
                            ),
                          ),
                          BouncyButton(
                            onPressed: () async {
                              goToNextFlow();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: screenWidth(context) * 0.3,
                              height: screenWidth(context) * 0.1,
                              decoration: BoxDecoration(
                                color: ColorUtils.primaryColor,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorUtils.primaryColor.withOpacity(0.5),
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(
                                "Continue",
                                style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      } else if (versionResponse.status == "match") {
        print("match");
        goToNextFlow();
      } else {
        print("else");
        goToNextFlow();
      }
    } else {
      developer.log('response code not 200');
    }
  }
}
