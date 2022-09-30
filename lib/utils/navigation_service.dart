import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/text_utils.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  getCurrentRoute() {
    // ModelRp
  }

  Future<dynamic> navigateTO(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> navigateToWithReplacement(String routeName) {
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  Future<dynamic> customAlertDialog({@required String message, @required String buttonText}) async {
    if (message != "Auth token expired") {
      return await showDialog(
        context: navigatorKey.currentState.overlay.context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(16),
            content: new Text(message ?? "", style: TextUtils.regularPoppinsStyle),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: ColorUtils.primaryColor,
                  fixedSize: Size(100, 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                child: Text(
                  buttonText,
                  style: TextUtils.regularPoppinsStyle,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
