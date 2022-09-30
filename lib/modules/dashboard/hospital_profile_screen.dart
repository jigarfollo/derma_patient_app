import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/error_handler.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:http/http.dart' as http;

import '../../utils/profile_details_widget.dart';

class HospitalProfileScreen extends StatefulWidget {
  static const String route = "HospitalProfileScreen";
  const HospitalProfileScreen({Key key}) : super(key: key);

  @override
  State<HospitalProfileScreen> createState() => _HospitalProfileScreenState();
}

class _HospitalProfileScreenState extends State<HospitalProfileScreen> {
  GlobalData globalData = locator<GlobalData>();
  HttpService httpService = locator<HttpService>();
  ClinicInfoResponse clinicInfoResponse = ClinicInfoResponse();

  @override
  void initState() {
    getClinicInfoApiCall();
    super.initState();
  }

  getClinicInfoApiCall() async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.fetchClinicInfo(
      userId: globalData.userId,
      userToken: globalData.userToken,
      clinicId: clinicId,
    );
    LoadingIndicator.dismiss();

    if (response.statusCode == 200) {
      setState(() {
        clinicInfoResponse.mergeFromBuffer(response.bodyBytes);
      });
      if (clinicInfoResponse.status == "success") {
        log(clinicInfoResponse.toString());
      } else {
        if (clinicInfoResponse.status == "auth_expired") {
          await getClinicInfoApiCall();
          return;
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(clinicInfoResponse.status),
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
        desc: ErrorHandler().getErrorMessage("Something went wrong!"),
        btnOkOnPress: () {},
      )..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundGreyColor,
      body: Column(children: [
        Stack(
          children: [
            Container(
              height: screenHeight(context) * 0.36,
              decoration: BoxDecoration(
                color: ColorUtils.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(getSize(30.0)),
                  bottomRight: Radius.circular(getSize(30.0)),
                ),
              ),
            ),
            Image.asset(
              ImageConstants.backgroundMaskLarge,
              height: screenHeight(context) * 0.36,
              width: screenWidth(context),
              fit: BoxFit.cover,
            ),
            Container(
              height: screenHeight(context) * 0.36,
              padding: EdgeInsets.symmetric(horizontal: getSize(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          left: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                              size: getSize(22),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        SizedBox(
                          width: getSize(104),
                          height: getSize(104),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: clinicInfoResponse.photo.url.isNotEmpty
                                ? CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: clinicInfoResponse.photo.url,
                                    placeholder: (context, url) => CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) => CupertinoActivityIndicator(),
                                  )
                                : Image.asset(ImageConstants.logoderma, fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getSize(12)),
                  Text(
                    clinicInfoResponse.name.isEmpty ? '-' : clinicInfoResponse.name,
                    textAlign: TextAlign.left,
                    style: TextUtils.semiBoldPoppinsStyle.copyWith(
                      color: ColorUtils.secondaryColor,
                      fontSize: getFontSize(15.0),
                    ),
                  ),
                  clinicInfoResponse.address.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ImageConstants.locator, color: ColorUtils.secondaryColor, width: 15),
                            SizedBox(width: getSize(6)),
                            Text(
                              clinicInfoResponse.address,
                              textAlign: TextAlign.left,
                              style: TextUtils.regularPoppinsStyle.copyWith(
                                color: ColorUtils.titleTextColorWhite,
                                fontSize: getFontSize(11.0),
                              ),
                            ),
                          ],
                        )
                      : Text(
                          '-',
                          style: TextUtils.regularPoppinsStyle.copyWith(
                            color: ColorUtils.titleTextColorWhite,
                            fontSize: getFontSize(11.0),
                          ),
                        ),
                  SizedBox(height: getSize(5)),
                  clinicInfoResponse.mobileNumber.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ImageConstants.dial, color: ColorUtils.secondaryColor, width: 15),
                            SizedBox(width: getSize(6)),
                            Text(
                              clinicInfoResponse.mobileNumber,
                              textAlign: TextAlign.left,
                              style: TextUtils.regularPoppinsStyle.copyWith(
                                color: ColorUtils.titleTextColorWhite,
                                fontSize: getFontSize(11.0),
                              ),
                            ),
                          ],
                        )
                      : Text(
                          '-',
                          style: TextUtils.regularPoppinsStyle.copyWith(
                            color: ColorUtils.titleTextColorWhite,
                            fontSize: getFontSize(11.0),
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: getSize(16),
              vertical: getSize(12),
            ),
            children: [
              ProfileDetailWidget(
                title: 'About ${clinicInfoResponse.name}',
                description: clinicInfoResponse.about.isEmpty ? '-' : clinicInfoResponse.about,
              ),
              ProfileDetailWidget(
                title: 'Departments',
                multiLineText: [
                  if (clinicInfoResponse.departments.isNotEmpty)
                    for (var department in clinicInfoResponse.departments) '- ${department.name}'
                  else
                    '-'
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
