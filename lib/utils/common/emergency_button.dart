import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/utils/error_handler.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'rounded_corner_buttons.dart';
import 'package:http/http.dart' as http;

class EmergencyButton extends StatefulWidget {
  const EmergencyButton({Key key}) : super(key: key);

  @override
  State<EmergencyButton> createState() => _EmergencyButtonState();
}

class _EmergencyButtonState extends State<EmergencyButton> {
  GlobalData globalData = locator<GlobalData>();
  HttpService httpService = locator<HttpService>();

  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  panicButtonApiCall() async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.panicButtonApi(
      userToken: globalData.userToken,
      userId: globalData.userId,
      clinicId: clinicId,
    );
    LoadingIndicator.dismiss();

    print(response.toString());

    if (response.statusCode == 200) {
      PanicButtonResponse panicButtonResponse = PanicButtonResponse();
      panicButtonResponse.mergeFromBuffer(response.bodyBytes);
      if (panicButtonResponse.status == "success") {
        if (panicButtonResponse != null) {
          print(panicButtonResponse.emergencyContact.toString());
          await _makePhoneCall(panicButtonResponse.emergencyContact);
        }
        // setState(() {});
      } else {
        if (panicButtonResponse.status == "auth_expired") {
          await panicButtonApiCall();
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(panicButtonResponse.status).toString(),
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
        desc: "Something went wrong!",
        btnOkOnPress: () {},
      )..show();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RoundedCornerButton(
      height: getSize(30),
      width: getSize(30),
      onPressed: () async {
        AwesomeDialog(
            dismissOnBackKeyPress: false,
            context: context,
            dialogType: DialogType.QUESTION,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'Confirmation',
            desc: "Are you sure to make call in emergency?",
            btnOkText: "Call",
            btnOkOnPress: () async {
              await panicButtonApiCall();
            },
            btnCancelOnPress: () {})
          ..show();
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.red.withOpacity(0.7), shape: BoxShape.circle),
        child: Padding(
          padding: EdgeInsets.all(getSize(6)),
          child: Icon(
            Icons.call,
            color: Colors.white,
            size: getSize(18),
          ),
        ),
      ),
    );
  }
}
