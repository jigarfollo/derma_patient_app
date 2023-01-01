import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/dashboard/doctor_profile_screen.dart';
import 'package:follo_patient_app/modules/dashboard/widgets/patient_chat_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/common/emergency_button.dart';
import 'package:follo_patient_app/utils/common/rounded_corner_buttons.dart';
import 'package:follo_patient_app/utils/common/rounded_corner_cards.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:follo_patient_app/utils/utils.dart';
import 'package:follo_patient_app/utils/widgets/empty_data_widget.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

TabController tabController;

class FolloUpListScreen extends StatefulWidget {
  static const String route = "folloStatusDoctorList";
  final bool upcomingFolloUps;
  final bool currentlyWorkInProgress;
  final bool pastFollowUps;
  final DrInfo caregiverInfo;
  const FolloUpListScreen({
    Key key,
    @required this.upcomingFolloUps,
    @required this.currentlyWorkInProgress,
    @required this.pastFollowUps,
    this.caregiverInfo,
  }) : super(key: key);

  @override
  _FolloUpListScreenState createState() => _FolloUpListScreenState();
}

class _FolloUpListScreenState extends State<FolloUpListScreen> with WidgetsBindingObserver, TickerProviderStateMixin {
  DateTime rangeStartDate = DateTime.now();
  DateTime rangeEndDate = DateTime.now();
  bool rangeDateError = false;
  GlobalData globalData = locator<GlobalData>();
  HttpService httpService = locator<HttpService>();
  List<FolloData> folloUpListData = [];
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<NewFollo> upcomingFollos = [];
  List<NewFollo> inProgressFollos = [];
  List<NewFollo> completedFollos = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: getCurrentIndex, length: 3, vsync: this);
    _setDateToDatePicker();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    tabController?.dispose();
  }

  int get getCurrentIndex {
    if (widget.upcomingFolloUps) {
      return 0;
    } else if (widget.currentlyWorkInProgress) {
      return 1;
    } else if (widget.pastFollowUps) {
      return 2;
    }
    return 0;
  }

  _setDateToDatePicker() {
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
    folloUpListApiCall();
  }

  bool folloUpListLoader = false;

  folloUpListApiCall() async {
    FolloUpList folloUpListObj = FolloUpList();

    LoadingIndicator.show(context);
    setState(() {
      folloUpListLoader = true;
    });
    folloUpListObj.userId = globalData.userId;
    folloUpListObj.userToken = globalData.userToken;
    folloUpListObj.clinicId = clinicId;
    folloUpListObj.filterByCaregiverId = widget.caregiverInfo != null && widget.caregiverInfo.userId.isNotEmpty ? true : false;
    folloUpListObj.caregiverId = widget.caregiverInfo != null ? widget.caregiverInfo.userId : '';
    folloUpListObj.startTimestamp = Int64.parseInt(rangeStartDate.millisecondsSinceEpoch.toString());
    folloUpListObj.endTimestamp = Int64.parseInt(rangeEndDate.millisecondsSinceEpoch.toString());
    folloUpListObj.filterByTimestamp = true;
    folloUpListObj.filterByPatientProfileId =
        Preference.shared.getSelectedPatientProfileId() == null || Preference.shared.getSelectedPatientProfileId() == "" ? false : true ?? false;
    folloUpListObj.patientProfileId = Preference.shared.getSelectedPatientProfileId() ?? "";

    log(folloUpListObj.toString());
    http.Response response = await httpService.folloUpList(folloUpListObject: folloUpListObj);

    LoadingIndicator.dismiss();
    setState(() {
      folloUpListLoader = false;
    });
    if (response.statusCode == 200) {
      FolloUpListResponse folloUpListResponse = FolloUpListResponse();
      folloUpListResponse.mergeFromBuffer(response.bodyBytes);
      log(jsonEncode(folloUpListResponse.toProto3Json()));

      if (folloUpListResponse.status == "success") {
        setState(() {
          folloUpListData.clear();
          upcomingFollos.clear();
          inProgressFollos.clear();
          completedFollos.clear();
          folloUpListData = folloUpListResponse.folloList;
          folloUpListData.forEach((element) {
            if (element.folloUpStatus == 'scheduled') {
              upcomingFollos = element.folloUpsList;
            } else if (element.folloUpStatus == 'initiated') {
              inProgressFollos = element.folloUpsList;
            } else if (element.folloUpStatus == 'completed') {
              completedFollos = element.folloUpsList;
            }
          });
        });
        print(folloUpListResponse.folloList.length);
      } else {
        if (folloUpListResponse.status == "auth_expired") {
          folloUpListApiCall();
          return;
        } else if (folloUpListResponse.status == "no_follos_found") {
          folloUpListData = [];
        }
      }
    } else {
      print('response code not 200');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundGreyColor,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    height: screenHeight(context) * 0.19,
                    child: Container(
                      height: screenHeight(context) * 0.16,
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
                    height: screenHeight(context) * 0.16,
                    width: screenWidth(context),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: getSize(26), left: getSize(6)),
                    alignment: Alignment.center,
                    height: screenHeight(context) * 0.15,
                    child: InkWell(
                      onTap: () {
                        Map<String, dynamic> dict = HashMap();
                        dict["caregiverInfo"] = widget.caregiverInfo;
                        NavigationUtilities.pushRoute(DoctorProfileScreen.route, args: dict);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                              size: getSize(22),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Container(
                            width: 42,
                            height: 42,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: widget.caregiverInfo.profilePicture.url != null && widget.caregiverInfo.profilePicture.url.isNotEmpty
                                  ? CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: widget.caregiverInfo.profilePicture.url,
                                      placeholder: (context, url) => CupertinoActivityIndicator(),
                                      errorWidget: (context, url, error) => new Icon(Icons.error),
                                    )
                                  : Image.asset(ImageConstants.doctor, fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: getSize(10)),
                          Text(
                            widget.caregiverInfo.name,
                            textAlign: TextAlign.left,
                            style: TextUtils.semiBoldPoppinsStyle.copyWith(
                              color: ColorUtils.titleTextColorWhite,
                              fontSize: getFontSize(16.0),
                            ),
                          ),
                          Spacer(),
                          EmergencyButton(),
                        ],
                      ),
                    ),
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
          ),
          SizedBox(height: getSize(8)),
          Expanded(
            child: SmartRefresher(
              controller: _refreshController,
              onRefresh: () async {
                await _setDateToDatePicker();
                _refreshController.refreshCompleted();
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: getSize(16), right: getSize(16)),
                    height: getSize(36),
                    child: TabBar(
                      controller: tabController,
                      labelColor: Colors.black,
                      indicatorColor: ColorUtils.primaryColor,
                      physics: NeverScrollableScrollPhysics(),
                      tabs: [
                        Tab(
                            child: Text(
                          "Upcoming",
                          style: TextUtils.mediumPoppinsStyle.copyWith(fontSize: getFontSize(12), fontWeight: FontWeight.w600),
                        )),
                        Tab(
                            child: Text(
                          "In-Progress",
                          style: TextUtils.mediumPoppinsStyle.copyWith(fontSize: getFontSize(12), fontWeight: FontWeight.w600),
                        )),
                        Tab(
                            child: Text(
                          "Completed",
                          style: TextUtils.mediumPoppinsStyle.copyWith(fontSize: getFontSize(12), fontWeight: FontWeight.w600),
                        )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        FollosList(
                          follosList: upcomingFollos,
                          upcomingFolloUps: true,
                          isLoading: folloUpListLoader,
                          inProgressFolloUpListLength: inProgressFollos.length,
                          onRefreshTabView: _setDateToDatePicker,
                          caregiverInfo: widget.caregiverInfo,
                          setDateToDatePicker: () {
                            _setDateToDatePicker();
                          },
                        ),
                        FollosList(
                          follosList: inProgressFollos,
                          currentlyWorkInProgress: true,
                          caregiverInfo: widget.caregiverInfo,
                          setDateToDatePicker: () {
                            _setDateToDatePicker();
                          },
                          isLoading: folloUpListLoader,
                          onRefreshTabView: _setDateToDatePicker,
                        ),
                        FollosList(
                          follosList: completedFollos,
                          pastFollowUps: true,
                          caregiverInfo: widget.caregiverInfo,
                          setDateToDatePicker: () {
                            _setDateToDatePicker();
                          },
                          isLoading: folloUpListLoader,
                          onRefreshTabView: _setDateToDatePicker,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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
}

class FollosList extends StatefulWidget {
  const FollosList({
    Key key,
    @required this.follosList,
    this.upcomingFolloUps = false,
    this.currentlyWorkInProgress = false,
    this.pastFollowUps = false,
    this.setDateToDatePicker,
    this.isLoading = false,
    this.inProgressFolloUpListLength,
    @required this.onRefreshTabView,
    this.caregiverInfo,
  }) : super(key: key);

  final List<NewFollo> follosList;
  final bool upcomingFolloUps;
  final bool currentlyWorkInProgress;
  final bool pastFollowUps;
  final bool isLoading;
  final int inProgressFolloUpListLength;
  final Function() setDateToDatePicker;
  final Function() onRefreshTabView;
  final DrInfo caregiverInfo;

  @override
  State<FollosList> createState() => _FollosListState();
}

class _FollosListState extends State<FollosList> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return widget.follosList.isEmpty && !widget.isLoading
        ? EmptyDataWidget(
            title: "There are no ${widget.upcomingFolloUps ? 'upcoming' : widget.currentlyWorkInProgress ? 'in-progress' : 'completed'} follow ups.",
            caregiverInfo: widget.caregiverInfo,
          )
        : SmartRefresher(
            controller: _refreshController,
            onRefresh: () async {
              await widget.onRefreshTabView();
              _refreshController.refreshCompleted();
            },
            child: ListView.builder(
              itemCount: widget.follosList.length,
              padding: EdgeInsets.only(left: getSize(8), right: getSize(8)),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(getSize(12))),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: getSize(8), top: getSize(8), left: getSize(12), right: getSize(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: screenWidth(context) * 0.62,
                                height: screenWidth(context) * 0.064,
                                child: (widget.follosList[index].diseaseName.toString()).length > 42
                                    ? Marquee(
                                        blankSpace: 50,
                                        velocity: 30,
                                        pauseAfterRound: Duration(
                                          seconds: 5,
                                        ),
                                        startAfter: Duration(
                                          seconds: 1,
                                        ),
                                        showFadingOnlyWhenScrolling: true,
                                        fadingEdgeStartFraction: 0.2,
                                        fadingEdgeEndFraction: 0.2,
                                        text: widget.follosList[index].diseaseName.toString() ?? "",
                                        style: TextUtils.regularPoppinsStyle.copyWith(
                                          fontSize: getFontSize(12),
                                          color: Colors.black,
                                        ),
                                      )
                                    : Text(
                                        widget.follosList[index].diseaseName.toString() ?? "",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextUtils.mediumPoppinsStyle.copyWith(
                                          fontSize: getFontSize(12),
                                          color: Colors.black,
                                        ),
                                      ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  DateFormat('dd MMM yyyy')
                                      .format(DateTime.fromMillisecondsSinceEpoch(int.parse(widget.follosList[index].folloUpStartTimestamp.toString())))
                                      .toString(),
                                  textAlign: TextAlign.start,
                                  style: TextUtils.mediumPoppinsStyle.copyWith(fontSize: getFontSize(10), color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          if (widget.upcomingFolloUps &&
                              index == 0 &&
                              DateTime.now()
                                  .isSameDate(DateTime.fromMillisecondsSinceEpoch(int.parse(widget.follosList[index].folloUpStartTimestamp.toString()))))
                            RoundedCornerButton(
                              width: getSize(96),
                              height: getSize(32),
                              borderRadius: BorderRadius.all(Radius.circular(getSize(26))),
                              color: ColorUtils.secondaryColor,
                              onPressed: () {
                                print(DateFormat('dd MMM yyyy / HH:mm aaa').format(DateTime.now()));
                                print(DateFormat('dd MMM yyyy / HH:mm aaa')
                                    .format(DateTime.fromMillisecondsSinceEpoch(int.parse(widget.follosList[index].folloUpStartTimestamp.toString())))
                                    .toString());
                                print("FOllo up status : " + widget.follosList[index].folloUpStatus.toString());
                                if (widget.inProgressFolloUpListLength > 0) {
                                  AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.INFO,
                                      animType: AnimType.TOPSLIDE,
                                      dismissOnTouchOutside: false,
                                      headerAnimationLoop: false,
                                      title: 'INFO',
                                      btnCancelText: "Cancel",
                                      btnOkText: "Continue",
                                      desc:
                                          "Please complete follo up that is currently in-progress then you can start this follo, Press Continue to proceed with it",
                                      btnOkOnPress: () {
                                        tabController.animateTo(1);
                                      },
                                      btnCancelOnPress: () {})
                                    ..show();
                                  return;
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => PatientChatScreen(
                                        folloUpId: widget.follosList[index].folloUpId,
                                        conversationId: widget.follosList[index].conversationId.toString(),
                                      ),
                                    ),
                                  ).then((value) {
                                    if (widget.setDateToDatePicker != null) {
                                      widget.setDateToDatePicker();
                                    }
                                  });
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: getSize(4), bottom: getSize(4), left: getSize(8), right: getSize(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Start",
                                      textAlign: TextAlign.center,
                                      style: TextUtils.boldPoppinsStyle.copyWith(fontSize: getFontSize(10), color: Colors.white),
                                    ),
                                    SizedBox(width: getSize(6)),
                                    Image.asset(
                                      ImageConstants.startFolloIcon,
                                      height: getSize(22),
                                      width: getSize(26),
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          if (widget.currentlyWorkInProgress || widget.pastFollowUps)
                            RoundedCornerButton(
                              width: getSize(96),
                              height: getSize(32),
                              borderRadius: BorderRadius.all(Radius.circular(getSize(26))),
                              color: ColorUtils.secondaryColor,
                              onPressed: () {
                                print(DateTime.now().toString());
                                print(DateFormat('dd MMM yyyy / HH:mm aaa')
                                    .format(DateTime.fromMillisecondsSinceEpoch(int.parse(widget.follosList[index].folloUpStartTimestamp.toString())))
                                    .toString());
                                print("FOllo up status : " + widget.follosList[index].folloUpStatus.toString());
                                if (widget.currentlyWorkInProgress || widget.pastFollowUps) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) => PatientChatScreen(
                                                folloUpId: widget.follosList[index].folloUpId,
                                                conversationId: widget.follosList[index].conversationId.toString(),
                                                enableOptions: widget.pastFollowUps ? false : true,
                                              ))).then((value) {
                                    if (widget.setDateToDatePicker != null) {
                                      widget.setDateToDatePicker();
                                    }
                                  });
                                } else {
                                  return;
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: getSize(4), bottom: getSize(4), left: getSize(8), right: getSize(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.currentlyWorkInProgress ? 'Continue' : "View",
                                      textAlign: TextAlign.center,
                                      style: TextUtils.boldPoppinsStyle.copyWith(fontSize: getFontSize(10), color: Colors.white),
                                    ),
                                    SizedBox(width: getSize(6)),
                                    widget.currentlyWorkInProgress
                                        ? Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.white,
                                            size: getSize(20),
                                          )
                                        : Image.asset(
                                            ImageConstants.viewFollo,
                                            height: getSize(22),
                                            width: getSize(22),
                                            color: Colors.white,
                                          )
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
