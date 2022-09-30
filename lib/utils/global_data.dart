import 'dart:async';

import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/auth/login_screen.dart';

import 'package:follo_patient_app/utils/navigation_service.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';

class GlobalData with ChangeNotifier {
  static final GlobalData _singleton = new GlobalData._internal();

  bool livePaymentKey = false;

  Timer _timer;
  int navigationRailIndex = 0;
  bool isNavigationRailExpanded = false;
  String _userToken;
  String _userId;

  NavigationService navigationService = locator<NavigationService>();
  String _userType;

  //Date range filter types
  List<dynamic> filterTypes = [
    // {'name': 'All', 'value': 'all'},
    {'name': 'This Month', 'value': 'this_month'},
    {'name': 'Last Month', 'value': 'last_month'},
    {'name': 'Next Month', 'value': 'next_month'},
  ];

  dynamic _selectedFilter = {'name': 'This Month', 'value': 'this_month'};

  dynamic get selectedFilter {
    return _selectedFilter;
  }

  setFilterType({dynamic filterData}) {
    _selectedFilter = filterData;
  }

  factory GlobalData() {
    return _singleton;
  }

  // userToken
  String get userToken {
    return _userToken;
    // return "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MTA5NTg4NzYsInVzZXJfaWQiOiJmMmQ2MTkyN2I3YWU0MWJmYmM5YzMwODUxNWZmZDQ2YyJ9.-81nZadYxgYzisWHLrN6fz7z7m926CA9VunSUzwsfVU";
  }

  setUserToken({String userToken}) {
    _userToken = userToken;
  }

  removeUserId() {
    _userId = null;
    // navigationService.navigateToLogin();
    NavigationUtilities.pushRoute(
      LoginScreen.route,
    );
  }

  // userId
  String get userId {
    return _userId;
    // return 'f2d61927b7ae41bfbc9c308515ffd46c';
  }

  setUserId({String userId}) {
    _userId = userId;
  }

  // user type
  String get userType {
    return _userType;
  }

  setUserType({String userType}) {
    _userType = userType;
  }

  GlobalData._internal();

  checkIfUserIsLoggedIn() {
    if (_userId != null && _userId != '') {
      return true;
    } else {
      Future.delayed(Duration.zero, () {
        if (_timer != null) _timer.cancel();
        // navigationService.navigateToLogin();
        NavigationUtilities.pushRoute(
          LoginScreen.route,
        );
      });
      return false;
    }
  }

  void initializeTimer() {
    _timer = Timer.periodic(const Duration(minutes: 15), (_) {
      if (_timer != null) _timer.cancel();
      removeUserId();
    });
  }
}
