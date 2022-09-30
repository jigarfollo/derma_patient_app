import 'dart:async';
import 'dart:collection';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/auth/login_screen.dart';
import 'package:follo_patient_app/modules/dashboard/dashboard_screen.dart';
import 'package:follo_patient_app/modules/hihello/hihello_screen.dart';
import 'package:follo_patient_app/modules/profile/settings_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  final bool isFromLogin;

  static const String route = "HomeScreen";

  const MainScreen({Key key, this.isFromLogin = false}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  int _currentPage = 0;
  PageController _pageController = PageController();
  bool currentlyWorkInProgress = false;
  bool upcomingFolloUps = false;
  bool pastFollowUps = false;
  GlobalData globalData = locator<GlobalData>();
  HttpService httpService = locator<HttpService>();
  Timer timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        await Preference.shared.setBool(Preference.shouldRouteFromNotification, true);

        if (timer != null) {
          print("applock cancelled");
        }
        timer?.cancel();
        checkAppStatus(appInBackground: false);
        print("app in resumed");
        break;
      case AppLifecycleState.inactive:
        print("app in inactive start");
        await Preference.shared.setWasAppKilled(true);
        print("app in inactive done");
        await Preference.shared.setBool(Preference.shouldRouteFromNotification, false);
        break;
      case AppLifecycleState.paused:
        timer = Timer(Duration(seconds: 30), () async {
          print("applock locked");
          await Preference.shared.setBool(Preference.shouldRouteFromNotification, false);
          NavigationUtilities.pushReplacementNamed(
            LoginScreen.route,
          );
        });
        checkAppStatus(appInBackground: true);
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        checkAppStatus(appInBackground: true);
        print("app in detached");
        break;
    }
  }

  checkAppStatus({bool appInBackground}) async {
    http.Response response = await httpService.checkAppStatus(
      userToken: globalData.userToken,
      userId: globalData.userId,
      appInBackground: appInBackground,
      clinicId: clinicId,
    );
    print("InitialSubscription api Status code: " + response.statusCode.toString());
    if (response.statusCode == 200) {
      AppStatusResponse appStatusResponse = AppStatusResponse();
      appStatusResponse.mergeFromBuffer(response.bodyBytes);
      if (appStatusResponse.status == "success") {
        print("Api call success");
      } else {
        print("Api call failed");
      }
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.TOPSLIDE,
        dismissOnTouchOutside: false,
        headerAnimationLoop: false,
        title: 'ERROR',
        desc: 'Something went wrong',
        btnOkOnPress: () {},
      )..show();
      return;
    }
  }

  List<MenuData> menuList = [
    MenuData('Home', ImageConstants.dashboard),
    MenuData('Hi/Hello', ImageConstants.hiHello),
    MenuData('Account', ImageConstants.account),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Map<String, dynamic> dict = HashMap();
        dict["isFromLogin"] = true;
        if (_currentPage != 0) {
          NavigationUtilities.pushReplacementNamed(
            MainScreen.route,
            args: dict,
          );
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          color: ColorUtils.backgroundGreyColor,
          child: AnimatedBottomNavigationBar.builder(
            itemCount: menuList.length,
            backgroundColor: ColorUtils.primaryColor,
            leftCornerRadius: 30,
            rightCornerRadius: 30,
            splashColor: ColorUtils.secondaryColor,
            activeIndex: _currentPage,
            gapWidth: 0,
            height: getSize(66),
            gapLocation: GapLocation.none,
            onTap: (index) => setState(() {
              _currentPage = index;
              _pageController.jumpToPage(_currentPage);
            }),
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? ColorUtils.secondaryColor : Colors.white;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    menuList[index].imagePath,
                    width: getSize(22),
                    height: getSize(22),
                    color: color,
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      menuList[index].label,
                      maxLines: 1,
                      style: TextUtils.semiBoldPoppinsStyle.copyWith(
                        fontSize: getFontSize(10),
                        color: color,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: menuList.length,
            onPageChanged: (position) {
              FocusScope.of(context).unfocus();
              setState(() {
                _currentPage = position;
              });
            },
            itemBuilder: (buildContext, position) {
              switch (position) {
                case 1:
                  return HiHelloScreen(
                    upcomingFolloUps: false,
                    currentlyWorkInProgress: false,
                    pastFollowUps: false,
                  );
                case 2:
                  return SettingScreen();
                case 0:
                default:
                  return DashboardScreen(
                    upcomingFolloUps: upcomingFolloUps,
                    currentlyWorkInProgress: currentlyWorkInProgress,
                    pastFollowUps: pastFollowUps,
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MenuData {
  MenuData(this.label, this.imagePath);
  String label;
  String imagePath;
}
