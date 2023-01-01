import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/dashboard/widgets/follo_up_list_screen.dart';
import 'package:follo_patient_app/modules/dashboard/widgets/patient_chat_screen.dart';
import 'package:follo_patient_app/modules/home/main_screen.dart';
import 'package:follo_patient_app/modules/patient_registration/widgets/qr_code_scanner.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/common/emergency_button.dart';
import 'package:follo_patient_app/utils/common/rounded_corner_cards.dart';
import 'package:follo_patient_app/utils/error_handler.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:follo_patient_app/utils/utils.dart';
import 'package:follo_patient_app/utils/widgets/logo_title.dart';
import 'package:follo_patient_app/utils/widgets/status_box.dart';
import 'package:follo_patient_app/utils/widgets/underline_text.dart';
import 'package:hovering/hovering.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'doctor_profile_screen.dart';
import 'hospital_profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String route = "DashboardScreen";
  final bool upcomingFolloUps;
  final bool currentlyWorkInProgress;
  final bool pastFollowUps;

  const DashboardScreen({Key key, this.upcomingFolloUps, this.currentlyWorkInProgress, this.pastFollowUps}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  GlobalData globalData = locator<GlobalData>();
  HttpService httpService = locator<HttpService>();
  DateTime rangeStartDate = DateTime.now();
  DateTime rangeEndDate = DateTime.now();
  int pastFollos;
  int upcomingFollos;
  int follosInProgress;
  List<StatsByCaregiver> _caregiverList = [];
  List<Patient> _patientList = [];
  String mobileNumber;
  final itemKey = GlobalKey();
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    mobileNumber = Preference.shared.getMobileNumber().toString();
    _setDateToDatePicker(isRefreshPatientList: true);
    super.initState();
  }

  void _animateToIndex(int index) {
    _controller.animateTo(
      index * screenWidth(context) * 0.45 - 100,
      duration: Duration(microseconds: 1),
      curve: Curves.easeIn,
    );
  }

  _setDateToDatePicker({bool isRefreshPatientList = false}) async {
    if (globalData.selectedFilter['value'] == "this_month") {
      rangeStartDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
      rangeEndDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 0, 23, 59, 59);
    } else if (globalData.selectedFilter['value'] == "last_month") {
      rangeStartDate = DateTime(DateTime.now().year, DateTime.now().month - 1, 1);
      rangeEndDate = DateTime(DateTime.now().year, DateTime.now().month, 0, 23, 59, 59);
    } else if (globalData.selectedFilter['value'] == "next_month") {
      rangeStartDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 1);
      rangeEndDate = DateTime(DateTime.now().year, DateTime.now().month + 2, 0, 23, 59, 59);
    } else {
      rangeStartDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
      rangeEndDate = DateTime.now();
    }
    if (isRefreshPatientList) await patientListApiCall();
    dashboardStatsApiCall(rangeStartDate, rangeEndDate);
  }

  dashboardStatsApiCall(DateTime rangeStartDate, DateTime rangeEndDate) async {
    print("Start date: " + rangeStartDate.toString());
    print("End date: " + rangeEndDate.toString());
    _caregiverList = [];

    LoadingIndicator.show(context);

    http.Response response = await httpService.dashboardStatsApi(
      userToken: globalData.userToken,
      userId: globalData.userId,
      startTimestamp: Int64.parseInt(rangeStartDate.millisecondsSinceEpoch.toString()),
      endTimestamp: Int64.parseInt(rangeEndDate.millisecondsSinceEpoch.toString()),
      clinicId: clinicId,
      filterByTimestamp: true,
      patientProfileId: Preference.shared.getSelectedPatientProfileId() ?? "",
      filterByPatientProfileId:
          Preference.shared.getSelectedPatientProfileId() == null || Preference.shared.getSelectedPatientProfileId() == "" ? false : true ?? false,
    );
    LoadingIndicator.dismiss();

    if (response.statusCode == 200) {
      FolloUpStatsResponse _folloUpStatsResponse = FolloUpStatsResponse();
      _folloUpStatsResponse.mergeFromBuffer(response.bodyBytes);

      if (_folloUpStatsResponse.status == "success") {
        log(_folloUpStatsResponse.statsByCaregiver.length.toString());
        _caregiverList.addAll(_folloUpStatsResponse.statsByCaregiver);
        log(_caregiverList.toString());

        setState(() {});
      } else {
        if (_folloUpStatsResponse.status == "auth_expired") {
          await dashboardStatsApiCall(rangeStartDate, rangeEndDate);
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(_folloUpStatsResponse.status),
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

  patientListApiCall() async {
    http.Response response = await httpService.patientList(
      userId: globalData.userId,
      userToken: globalData.userToken,
      clinicId: clinicId,
      mobileNumber: "+91" + mobileNumber,
    );

    if (response.statusCode == 200) {
      _patientList = [];
      PatientListResponse patientListResponse = PatientListResponse();
      patientListResponse.mergeFromBuffer(response.bodyBytes);

      if (patientListResponse.status == "success") {
        log(patientListResponse.patientdata.length.toString());
        for (var i = 0; i < patientListResponse.patientdata.length; i++) {
          _patientList.add(patientListResponse.patientdata[i]);
        }
        print(Preference.shared.getSelectedPatientProfileId());
        if (Preference.shared.getSelectedPatientProfileId() == null || Preference.shared.getSelectedPatientProfileId() == "") {
          await Preference.shared.setSelectedPatientProfileId(patientListResponse.patientdata[0].patientProfileId ?? "");
        } else {
          for (var i = 0; i < _patientList.length; i++) {
            if (_patientList[i].patientProfileId == Preference.shared.getSelectedPatientProfileId()) {
              await Preference.shared.setSelectedPatientProfileId(_patientList[i].patientProfileId ?? "");
              _animateToIndex(i);
            }
          }
        }
        setState(() {});
        log(_patientList.length.toString());
      } else {
        if (patientListResponse.status == "auth_expired") {
          await patientListApiCall();
          return;
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(patientListResponse.status),
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
  void dispose() {
    scrollController?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundGreyColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          appBar(context),
          SizedBox(height: getSize(16)),
          Expanded(
            child: SmartRefresher(
              controller: _refreshController,
              onRefresh: () async {
                await _setDateToDatePicker();
                _refreshController.refreshCompleted();
              },
              child: Padding(
                padding: EdgeInsets.only(left: getSize(20), right: getSize(20)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UnderlineText(title: 'Messages from'),
                      SizedBox(height: getSize(8)),
                      for (int index in Iterable.generate(_caregiverList.length))
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LogoTitle(
                              title: _caregiverList[index].doctorInfo.name,
                              imagePath: _caregiverList[index].doctorInfo.profilePicture.url,
                              onTap: () {
                                Map<String, dynamic> dict = HashMap();
                                dict["caregiverInfo"] = _caregiverList[index].doctorInfo;
                                log(jsonEncode(_caregiverList[index].doctorInfo.toProto3Json()));
                                NavigationUtilities.pushRoute(
                                  DoctorProfileScreen.route,
                                  args: dict,
                                );
                              },
                            ),
                            SizedBox(height: getSize(8)),
                            Row(
                              children: [
                                StatusBox(
                                  count: _caregiverList[index].data.singleWhere((element) => element.id == "scheduled").total,
                                  label: 'Upcoming',
                                  color: ColorUtils.greenColor2,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) => FolloUpListScreen(
                                                  upcomingFolloUps: true,
                                                  currentlyWorkInProgress: false,
                                                  pastFollowUps: false,
                                                  caregiverInfo: _caregiverList[index].doctorInfo,
                                                ))).then((value) {
                                      Map<String, dynamic> dict = HashMap();
                                      dict["isFromLogin"] = false;
                                      NavigationUtilities.pushReplacementNamed(
                                        MainScreen.route,
                                        args: dict,
                                      );
                                    });
                                  },
                                ),
                                SizedBox(width: getSize(12)),
                                StatusBox(
                                  count: _caregiverList[index].data.singleWhere((element) => element.id == "initiated").total,
                                  label: 'In-Progress',
                                  color: ColorUtils.pinkColor,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) => FolloUpListScreen(
                                                  upcomingFolloUps: false,
                                                  currentlyWorkInProgress: true,
                                                  pastFollowUps: false,
                                                  caregiverInfo: _caregiverList[index].doctorInfo,
                                                ))).then((value) {
                                      Map<String, dynamic> dict = HashMap();
                                      dict["isFromLogin"] = false;
                                      NavigationUtilities.pushReplacementNamed(
                                        MainScreen.route,
                                        args: dict,
                                      );
                                    });
                                  },
                                ),
                                SizedBox(width: getSize(12)),
                                StatusBox(
                                  count: _caregiverList[index].data.singleWhere((element) => element.id == "completed").total,
                                  label: 'Completed',
                                  color: ColorUtils.purpleColor,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) => FolloUpListScreen(
                                                  upcomingFolloUps: false,
                                                  currentlyWorkInProgress: false,
                                                  pastFollowUps: true,
                                                  caregiverInfo: _caregiverList[index].doctorInfo,
                                                ))).then((value) {
                                      Map<String, dynamic> dict = HashMap();
                                      dict["isFromLogin"] = false;
                                      NavigationUtilities.pushReplacementNamed(
                                        MainScreen.route,
                                        args: dict,
                                      );
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: getSize(18)),
                          ],
                        ),
                      // SizedBox(height: getSize(8)),
                      // UnderlineText(title: 'Message from ${Utils.appName}'),
                      // SizedBox(height: getSize(8)),
                      // for (var _ in Iterable.generate(2))
                      //   Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       LogoTitle(
                      //         title: 'Dr. John Doe',
                      //         imagePath: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-1.2.1&ixid'
                      //             '=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
                      //         onTap: () {
                      //           Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorProfileScreen()));
                      //         },
                      //       ),
                      //       SizedBox(height: getSize(8)),
                      //       Row(
                      //         children: [
                      //           StatusBox(count: 5, label: 'In-Progress', color: ColorUtils.pinkColor),
                      //           SizedBox(width: getSize(12)),
                      //           StatusBox(count: 543, label: 'Completed', color: ColorUtils.purpleColor),
                      //           SizedBox(width: getSize(12)),
                      //           Spacer(),
                      //         ],
                      //       ),
                      //       SizedBox(height: getSize(18)),
                      //     ],
                      //   ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getColorContainer(Color color, String number, String labelTxt) {
    return HoverWidget(
      hoverChild: _hoverContainer(
        color,
        number,
        labelTxt,
        isHover: true,
      ),
      onHover: (event) {},
      child: _hoverContainer(
        color,
        number,
        labelTxt,
        isHover: false,
      ),
    );
  }

  _hoverContainer(Color color, String number, String labelTxt, {bool isHover}) {
    return RoundedColorCornerCard(
      borderRadius: BorderRadius.circular(20),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: screenWidth(context) * 0.03),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    number,
                    style: TextUtils.boldPoppinsStyle.copyWith(
                      fontSize: getFontSize(32),
                      color: color,
                    ),
                  ),
                  Text(
                    labelTxt,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextUtils.regularPoppinsStyle.copyWith(
                      fontSize: getFontSize(10),
                      color: color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showBottomSheetForDateRange(BuildContext context, List<dynamic> rangeList) async {
    return showModalBottomSheet(
      context: context,
      builder: (builder) {
        return StatefulBuilder(
          builder: (context, bottomSheetState) {
            return Container(
              color: Color(0xFF737373),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      getSize(30),
                    ),
                    topRight: Radius.circular(
                      getSize(30),
                    ),
                  ),
                ),
                child: DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.50,
                  maxChildSize: 0.64,
                  builder: (BuildContext context, ScrollController scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: getSize(5),
                                width: screenWidth(context) * 0.3,
                                decoration: BoxDecoration(
                                  color: ColorUtils.getColorFromHex("70" + ColorUtils.primaryDarkColorString),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.builder(
                              itemCount: rangeList.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, position) {
                                return Container(
                                  key: UniqueKey(),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: InkWell(
                                      onTap: () {
                                        bottomSheetState(() {
                                          globalData.setFilterType(filterData: rangeList[position]);
                                          _setDateToDatePicker();

                                          Navigator.of(context).pop();
                                        });
                                        setState(() {});
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            rangeList[position]['name'].toString(),
                                            style: globalData.selectedFilter['value'] == rangeList[position]['value']
                                                ? TextUtils.semiBoldPoppinsStyle.copyWith(fontSize: getFontSize(14), color: ColorUtils.primaryColor)
                                                : TextUtils.regularPoppinsStyle.copyWith(
                                                    fontSize: getFontSize(14),
                                                  ),
                                          ),
                                          Checkbox(
                                            value: globalData.selectedFilter['value'] == rangeList[position]['value'],
                                            checkColor: Colors.white,
                                            activeColor: ColorUtils.primaryColor,
                                            onChanged: (newValue) {
                                              bottomSheetState(() {
                                                globalData.setFilterType(filterData: rangeList[position]);

                                                _setDateToDatePicker();
                                                Navigator.of(context).pop();
                                              });
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget appBar(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: screenHeight(context) * 0.24,
              child: Container(
                height: screenHeight(context) * 0.28,
                decoration: BoxDecoration(
                  color: ColorUtils.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(getSize(30.0)),
                    bottomRight: Radius.circular(getSize(30.0)),
                  ),
                ),
              ),
            ),
            Image.asset(
              ImageConstants.backgroundMask1,
              height: screenHeight(context) * 0.22,
              width: screenWidth(context),
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: screenHeight(context) * 0.27,
                  child: Column(
                    children: [
                      SizedBox(
                        height: getSize(46),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getSize(26)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                NavigationUtilities.pushRoute(HospitalProfileScreen.route);
                              },
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.asset(ImageConstants.logoderma, width: getSize(50)),
                                  ),
                                  SizedBox(width: getSize(10)),
                                  Text(
                                    Utils.appName,
                                    textAlign: TextAlign.left,
                                    style: TextUtils.semiBoldPoppinsStyle
                                        .copyWith(color: ColorUtils.titleTextColorWhite, fontSize: getFontSize(16.0), fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: getSize(26)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => QRCodeScannerView()));
                                    },
                                    child: Image.asset(
                                      ImageConstants.scanninglogo,
                                      height: getSize(22),
                                    ),
                                  ),
                                ),
                                EmergencyButton(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getSize(12),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: getSize(8)),
                        height: screenHeight(context) * 0.07,
                        child: ListView.builder(
                            itemCount: _patientList.length,
                            scrollDirection: Axis.horizontal,
                            controller: _controller,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(right: getSize(8)),
                                child: InkWell(
                                  onTap: () {
                                    Preference.shared.setSelectedPatientProfileId(_patientList[index].patientProfileId ?? "");
                                    _animateToIndex(index);
                                    _setDateToDatePicker();
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: getSize(16),
                                    width: screenWidth(context) * 0.45,
                                    decoration: BoxDecoration(
                                        color: _patientList[index].patientProfileId == Preference.shared.getSelectedPatientProfileId()
                                            ? ColorUtils.secondaryColor
                                            : Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(getSize(26))),
                                        border: Border.all(color: ColorUtils.secondaryColor, width: getSize(2))),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: getSize(8), top: getSize(7), bottom: getSize(6), right: getSize(4)),
                                      child: Row(
                                        children: [
                                          _patientList[index].profilePicture.url.isNotEmpty
                                              ? Center(
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(getSize(100)),
                                                    child: InkWell(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return SimpleDialog(
                                                              contentPadding: EdgeInsets.zero,
                                                              backgroundColor: Colors.transparent,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: InteractiveViewer(
                                                                    child: Image.network(
                                                                      _patientList[index].profilePicture.url,
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Image.network(
                                                        _patientList[index].profilePicture.url.toString(),
                                                        width: getSize(32),
                                                        height: getSize(32),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Center(
                                                  child: CircleAvatar(
                                                    radius: screenWidth(context) * 0.04,
                                                    // backgroundColor: ColorUtils.secondaryColor,
                                                    child: CircleAvatar(
                                                      backgroundColor: Colors.white,
                                                      child: Image.asset(
                                                        _patientList[index].gender.toString().toLowerCase() == "male"
                                                            ? ImageConstants.maleProfileIcon
                                                            : ImageConstants.femaleProfileIcon ?? ImageConstants.maleProfileIcon,
                                                        color: ColorUtils.primaryColor.withOpacity(0.7),
                                                      ),
                                                      radius: screenWidth(context) * 0.04,
                                                    ),
                                                  ),
                                                ),
                                          SizedBox(
                                            width: getSize(8),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: screenWidth(context) * 0.28,
                                                child: Text(
                                                  _patientList[index].firstName + " " + _patientList[index].lastName,
                                                  style: TextUtils.mediumPoppinsStyle.copyWith(
                                                    color: _patientList[index].patientProfileId == Preference.shared.getSelectedPatientProfileId()
                                                        ? Colors.white
                                                        : ColorUtils.secondaryColor,
                                                    fontSize: getFontSize(12.0),
                                                    fontWeight: FontWeight.w700,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                              ),
                                              SizedBox(
                                                height: getSize(2),
                                              ),
                                              Center(
                                                child: Text(
                                                  "Age : ${_patientList[index].age}",
                                                  style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                                    color: _patientList[index].patientProfileId == Preference.shared.getSelectedPatientProfileId()
                                                        ? Colors.white
                                                        : ColorUtils.secondaryColor,
                                                    fontSize: getFontSize(10.0),
                                                    fontWeight: FontWeight.w700,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: screenHeight(context) * 0.06,
          child: InkWell(
            onTap: () {
              showBottomSheetForDateRange(context, globalData.filterTypes);
            },
            child: Container(
              width: screenWidth(context) * 0.90,
              height: screenHeight(context) * 0.08,
              child: RoundedCornerCard(
                borderRadius: BorderRadius.circular(100),
                child: Padding(
                  padding: EdgeInsets.only(left: getSize(16), right: getSize(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        globalData.selectedFilter['name'],
                        style: TextUtils.regularPoppinsStyle.copyWith(
                          fontSize: getFontSize(11),
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
