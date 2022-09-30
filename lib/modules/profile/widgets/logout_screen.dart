import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/auth/login_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
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

class LogoutPopUp extends StatefulWidget {
  @override
  _LogoutPopUpState createState() => _LogoutPopUpState();
}

class _LogoutPopUpState extends State<LogoutPopUp> {
  GlobalData globalData = locator<GlobalData>();
  HttpService httpService = locator<HttpService>();

  @override
  Widget build(BuildContext context) {
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
              ImageConstants.logoutIcon,
              width: screenHeight(context) * 0.1,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: screenWidth(context) * 0.05),
              child: Text(
                "Are you sure  you want to logout?",
                textAlign: TextAlign.center,
                style: TextUtils.semiBoldPoppinsStyle.copyWith(fontSize: getFontSize(16)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BouncyButton(
                  onPressed: () {
                    Navigator.pop(context);
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
                      "No",
                      style: TextUtils.semiBoldPoppinsStyle,
                    ),
                  ),
                ),
                BouncyButton(
                  onPressed: () async {
                    await logoutApiCall();
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
                      "Yes",
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
  }

  logoutApiCall() async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.logoutApi(
      userid: globalData.userId,
      usertoken: globalData.userToken,
      clinicId: clinicId,
    );
    if (response.statusCode == 200) {
      LogoutResponse logooutResponse = LogoutResponse();
      logooutResponse.mergeFromBuffer(response.bodyBytes);
      print(logooutResponse.toString());
      if (logooutResponse.loggedOut) {
        if (logooutResponse.status == "success") {
          Preference.shared.clearSharedPreference();
          LoadingIndicator.dismiss();
          Navigator.pop(context);
          await Preference.shared.setBool(Preference.shouldRouteFromNotification, false);
          NavigationUtilities.pushReplacementNamed(
            LoginScreen.route,
          );
        } else {
          LoadingIndicator.dismiss();
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(logooutResponse.status),
            btnOkOnPress: () {},
          )..show();
        }
      } else {
        LoadingIndicator.dismiss();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.TOPSLIDE,
          dismissOnTouchOutside: false,
          headerAnimationLoop: false,
          title: 'ERROR',
          desc: ErrorHandler().getErrorMessage(logooutResponse.status),
          btnOkOnPress: () {},
        )..show();
      }
    }
    LoadingIndicator.dismiss();
  }
}
