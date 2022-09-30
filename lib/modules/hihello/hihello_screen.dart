import 'dart:convert';
import 'dart:developer';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/dashboard/hospital_profile_screen.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/common/emergency_button.dart';
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

import '../../protobuf_packets/follo.pb.dart';

class HiHelloScreen extends StatefulWidget {
  static const String route = "HiHelloScreen";
  final bool upcomingFolloUps;
  final bool currentlyWorkInProgress;
  final bool pastFollowUps;
  final DrInfo caregiverInfo;

  const HiHelloScreen({
    Key key,
    @required this.upcomingFolloUps,
    @required this.currentlyWorkInProgress,
    @required this.pastFollowUps,
    this.caregiverInfo,
  }) : super(key: key);

  @override
  State<HiHelloScreen> createState() => _HiHelloScreenState();
}

class _HiHelloScreenState extends State<HiHelloScreen> with WidgetsBindingObserver, TickerProviderStateMixin {
  DateTime rangeStartDate = DateTime.now();
  DateTime rangeEndDate = DateTime.now();
  bool rangeDateError = false;
  GlobalData globalData = locator<GlobalData>();
  HttpService httpService = locator<HttpService>();
  List<FolloData> folloUpListData = [];
  TabController tabController;
  List<NewFollo> upcomingFollos = [];
  List<NewFollo> inProgressFollos = [];
  List<NewFollo> completedFollos = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: getCurrentIndex, length: 2, vsync: this);
    // _setDateToDatePicker();
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
      rangeEndDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    } else if (globalData.selectedFilter['value'] == "last_month") {
      rangeStartDate = DateTime(DateTime.now().year, DateTime.now().month - 1, 1);
      rangeEndDate = DateTime(DateTime.now().year, DateTime.now().month, 0);
    } else if (globalData.selectedFilter['value'] == "next_month") {
      rangeStartDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 1);
      rangeEndDate = DateTime(DateTime.now().year, DateTime.now().month + 2, 0);
    } else {
      rangeStartDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
      rangeEndDate = DateTime.now();
    }
    folloUpListApiCall();
  }

  folloUpListApiCall() async {
    FolloUpList folloUpListObj = FolloUpList();

    LoadingIndicator.show(context);

    folloUpListObj.userId = globalData.userId;
    folloUpListObj.userToken = globalData.userToken;
    folloUpListObj.clinicId = clinicId;
    folloUpListObj.filterByCaregiverId = widget.caregiverInfo != null && widget.caregiverInfo.userId.isNotEmpty ? true : false;
    folloUpListObj.caregiverId = widget.caregiverInfo != null ? widget.caregiverInfo.userId : '';
    folloUpListObj.startTimestamp = Int64.parseInt(rangeStartDate.millisecondsSinceEpoch.toString());
    folloUpListObj.endTimestamp = Int64.parseInt(rangeEndDate.millisecondsSinceEpoch.toString());
    folloUpListObj.filterByTimestamp = true;

    log(folloUpListObj.toString());
    http.Response response = await httpService.folloUpList(folloUpListObject: folloUpListObj);

    LoadingIndicator.dismiss();

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
          // folloUpListData.forEach((element) {
          //   if (element.folloUpStatus == 'scheduled') {
          //     upcomingFollos = element.folloUpsList;
          //   } else if (element.folloUpStatus == 'initiated') {
          //     inProgressFollos = element.folloUpsList;
          //   } else if (element.folloUpStatus == 'completed') {
          //     completedFollos = element.folloUpsList;
          //   }
          // });
        });
        print(folloUpListResponse.folloList.length);
        // if (folloUpListResponse.totalCount != null && folloUpListResponse.totalCount != 0 && folloUpListResponse.itemsInPage != null && folloUpListResponse.itemsInPage != 0) {
        //   totalPages = folloUpListResponse.totalCount / rowCount;
        //   print(totalPages.ceil().toString());
        //   print("Count of records in screen : " + folloUpListData.length.toString());
        //   setState(() {});
        // } else {
        //   print("No data found");
        // }
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
                    height: screenHeight(context) * 0.18,
                    child: Container(
                      height: screenHeight(context) * 0.15,
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
                    height: screenHeight(context) * 0.15,
                    width: screenWidth(context),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: getSize(26)),
                    alignment: Alignment.center,
                    height: screenHeight(context) * 0.15,
                    child: InkWell(
                      onTap: () {
                        NavigationUtilities.pushRoute(HospitalProfileScreen.route);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(ImageConstants.logoderma, width: 50),
                          ),
                          SizedBox(width: getSize(10)),
                          Text(
                            '${Utils.appName}',
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

          SizedBox(
            height: getSize(8),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
          //   child: Column(
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Row(
          //             children: [
          //               Text(
          //                 'Jump to',
          //                 style: TextUtils.regularPoppinsStyle.copyWith(
          //                   fontSize: getFontSize(14),
          //                   color: ColorUtils.screenBackgroundTextColor,
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: getSize(8),
          //               ),
          //               Container(
          //                 width: screenWidth(context) * 0.12,
          //                 height: 40,
          //                 child: CustomCard(
          //                   child: TextFormField(
          //                     controller: _pageNumberController,
          //                     readOnly: false,
          //                     inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
          //                     onChanged: (String value) async {
          //                       if (int.tryParse(value.toString()) <= int.tryParse(totalPages.ceil().toString()) &&
          //                           int.tryParse(value.toString()) > 0) {
          //                         currentPageNumber = int.parse(value);
          //                         // pageError = false;
          //                         _pageNumberController.text = currentPageNumber.toString();
          //                         setState(() {});
          //                         await folloUpListApiCall();
          //                         FocusScope.of(context).unfocus();
          //                       } else {
          //                         _pageNumberController.clear();
          //                       }
          //                     },
          //                     autovalidateMode: AutovalidateMode.onUserInteraction,
          //                     textAlign: TextAlign.center,
          //                     style: TextUtils.semiBoldPoppinsStyle.copyWith(
          //                       fontSize: getFontSize(14.0),
          //                     ),
          //                     decoration: DecorationUtils.customInputDecoration.copyWith(
          //                       labelText: '',
          //                       contentPadding: EdgeInsets.only(left: 8, right: 8),
          //                     ),
          //                     onFieldSubmitted: (String val) async {
          //                       if (int.tryParse(val.toString()) > 0 && int.tryParse(val.toString()) <= int.tryParse(totalPages.toString())) {
          //                         currentPageNumber = int.parse(val);
          //                         _pageNumberController.text = currentPageNumber.toString();
          //                         pageError = false;
          //                       } else {
          //                         _pageNumberController.clear();
          //                         pageError = true;
          //                       }
          //                     },
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: getSize(4),
          //               ),
          //               Text(
          //                 'of ',
          //                 style: TextUtils.regularPoppinsStyle.copyWith(
          //                   fontSize: getFontSize(14),
          //                   color: ColorUtils.screenBackgroundTextColor,
          //                 ),
          //               ),
          //               Text(
          //                 totalPages.ceil().toString(),
          //                 style: TextUtils.regularPoppinsStyle.copyWith(
          //                   fontSize: getFontSize(14),
          //                   color: ColorUtils.screenBackgroundTextColor,
          //                 ),
          //               ),
          //               Visibility(
          //                 visible: pageError,
          //                 child: SizedBox(
          //                   width: getSize(4),
          //                 ),
          //               ),
          //               if (pageError) Icon(Icons.error, color: Colors.red, size: 18),
          //             ],
          //           ),
          //           Row(
          //             children: [
          //               Text(
          //                 'Show',
          //                 style: TextUtils.regularPoppinsStyle.copyWith(
          //                   fontSize: getFontSize(14),
          //                   color: ColorUtils.screenBackgroundTextColor,
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: 4,
          //               ),
          //               Container(
          //                 width: screenWidth(context) * 0.18,
          //                 height: 40,
          //                 decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.circular(10),
          //                   border: Border.all(
          //                     color: Color.fromRGBO(222, 222, 223, 1),
          //                   ),
          //                   boxShadow: [
          //                     BoxShadow(
          //                       color: Colors.grey.withOpacity(0.2),
          //                       spreadRadius: 2,
          //                       blurRadius: 30,
          //                       offset: Offset(2, 10), // changes position of shadow
          //                     ),
          //                   ],
          //                 ),
          //                 padding: EdgeInsets.zero,
          //                 child: Padding(
          //                   padding: EdgeInsets.only(left: 6, right: 2),
          //                   child: DropdownButtonFormField<int>(
          //                     focusColor: Colors.white,
          //                     icon: Icon(Icons.arrow_drop_down, color: ColorUtils.dropdownColor, size: 16),
          //                     decoration: InputDecoration(
          //                       contentPadding: EdgeInsets.only(left: 2, bottom: 10),
          //                       enabledBorder: UnderlineInputBorder(
          //                         borderSide: BorderSide(
          //                           color: Colors.transparent,
          //                         ),
          //                       ),
          //                       fillColor: Colors.white,
          //                       filled: false,
          //                     ),
          //                     value: rowCount,
          //                     iconSize: 24,
          //                     style: TextUtils.semiBoldPoppinsStyle.copyWith(
          //                       fontSize: getFontSize(8.0),
          //                     ),
          //                     onChanged: (value) async {
          //                       setState(() {
          //                         rowCount = value;
          //                         currentPageNumber = 1;
          //                         _pageNumberController.text = currentPageNumber.toString();
          //                         folloUpListApiCall();
          //                         FocusScope.of(context).unfocus();
          //                       });
          //                     },
          //                     validator: (value) => value == null ? 'field required' : null,
          //                     items: [10, 20, 30, 50, 100].map((int value) {
          //                       return new DropdownMenuItem<int>(
          //                         value: value,
          //                         child: Center(
          //                           child: Container(
          //                               child: new Text(value.toString(),
          //                                   style: TextUtils.semiBoldPoppinsStyle.copyWith(fontSize: getFontSize(14.0), color: Colors.black))),
          //                         ),
          //                       );
          //                     }).toList(),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           )
          //         ],
          //       ),
          //       SizedBox(
          //         height: 16,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           BouncyButton(
          //             onPressed: () async {
          //               if (currentPageNumber > 1) {
          //                 currentPageNumber--;
          //                 _pageNumberController.text = currentPageNumber.toString();
          //                 pageError = false;
          //                 setState(() {});
          //                 await folloUpListApiCall();
          //                 FocusScope.of(context).unfocus();
          //               }
          //             },
          //             child: Row(
          //               children: [
          //                 Icon(Icons.keyboard_arrow_left, size: getSize(24), color: ColorUtils.primaryColor),
          //                 Text(
          //                   'Prev',
          //                   style: TextUtils.regularPoppinsStyle.copyWith(
          //                     fontSize: getFontSize(14),
          //                     color: ColorUtils.primaryColor,
          //                   ),
          //                   maxLines: 1,
          //                 )
          //               ],
          //             ),
          //           ),
          //           BouncyButton(
          //             onPressed: () async {
          //               if (currentPageNumber < totalPages) {
          //                 currentPageNumber++;
          //                 _pageNumberController.text = currentPageNumber.toString();
          //                 pageError = false;
          //                 setState(() {});
          //                 await folloUpListApiCall();

          //                 FocusScope.of(context).unfocus();
          //               }
          //             },
          //             child: Row(
          //               children: [
          //                 Text(
          //                   'Next',
          //                   style: TextUtils.regularPoppinsStyle.copyWith(
          //                     fontSize: getFontSize(14),
          //                     color: ColorUtils.primaryColor,
          //                   ),
          //                   maxLines: 1,
          //                 ),
          //                 Icon(Icons.keyboard_arrow_right, size: getSize(24), color: ColorUtils.primaryColor),
          //               ],
          //             ),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          Expanded(
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: EdgeInsets.only(left: getSize(16), right: getSize(16)),
                  height: getSize(36),
                  child: TabBar(
                    controller: tabController,
                    labelColor: Colors.black,
                    physics: NeverScrollableScrollPhysics(),
                    indicatorColor: ColorUtils.primaryColor,
                    tabs: [
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
                      EmptyDataWidget(title: 'There are no in-progress conversations.'),
                      EmptyDataWidget(title: 'There are no completed conversations.'),
                    ],
                  ),
                )
                // Container(
                //   height: 200,
                //   child: ListView.builder(
                //     itemCount: folloUpListData.length,
                //     padding: EdgeInsets.only(left: getSize(8), right: getSize(8)),
                //     itemBuilder: (BuildContext context, int index) {
                //       return Card(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(getSize(12))),
                //         ),
                //         child: Center(
                //           child: Padding(
                //             padding: EdgeInsets.only(bottom: getSize(8), top: getSize(8), left: getSize(12), right: getSize(12)),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Row(
                //                   crossAxisAlignment: CrossAxisAlignment.center,
                //                   children: [
                //                     SizedBox(
                //                       width: screenWidth(context) * 0.55,
                //                       height: screenWidth(context) * 0.05,
                //                       child: (folloUpListData[index].diseaseName.toString()).length > 42
                //                           ? Marquee(
                //                               blankSpace: 50,
                //                               velocity: 30,
                //                               pauseAfterRound: Duration(
                //                                 seconds: 5,
                //                               ),
                //                               startAfter: Duration(
                //                                 seconds: 1,
                //                               ),
                //                               showFadingOnlyWhenScrolling: true,
                //                               fadingEdgeStartFraction: 0.2,
                //                               fadingEdgeEndFraction: 0.2,
                //                               text: folloUpListData[index].diseaseName.toString() ?? "",
                //                               style: TextUtils.regularPoppinsStyle.copyWith(
                //                                 fontSize: getFontSize(12),
                //                                 color: Colors.black,
                //                               ),
                //                             )
                //                           : Text(
                //                               folloUpListData[index].diseaseName.toString() ?? "",
                //                               maxLines: 1,
                //                               overflow: TextOverflow.ellipsis,
                //                               style: TextUtils.mediumPoppinsStyle.copyWith(
                //                                 fontSize: getFontSize(12),
                //                                 color: Colors.black,
                //                               ),
                //                             ),
                //                     ),
                //                     Spacer(),
                //                     // (DateTime.now().isSameDate(DateTime.fromMillisecondsSinceEpoch(
                //                     //             int.parse(folloUpListData[index].folloUpStartTimestamp.toString()))) &&
                //                     //         !widget.pastFollowUps)
                //                     //     ? Container(
                //                     //         decoration: BoxDecoration(
                //                     //             borderRadius: BorderRadius.all(Radius.circular(16)),
                //                     //             color: ColorUtils.secondaryColor),
                //                     //         child: Padding(
                //                     //           padding:
                //                     //               EdgeInsets.only(top: getSize(6), bottom: getSize(6), left: getSize(12), right: getSize(12)),
                //                     //           child: Row(
                //                     //             children: [
                //                     //               Text(
                //                     //                 widget.currentlyWorkInProgress ? 'Continue Follo' : "Start Follo",
                //                     //                 style:
                //                     //                     TextUtils.boldPoppinsStyle.copyWith(fontSize: getFontSize(10), color: Colors.white),
                //                     //               ),
                //                     //               SizedBox(
                //                     //                 width: getSize(4),
                //                     //               ),
                //                     //               widget.currentlyWorkInProgress
                //                     //                   ? Icon(
                //                     //                       Icons.keyboard_arrow_right,
                //                     //                       color: Colors.white,
                //                     //                       size: getSize(20),
                //                     //                     )
                //                     //                   : Image.asset(
                //                     //                       ImageConstants.startFolloIcon,
                //                     //                       height: getSize(22),
                //                     //                       width: getSize(26),
                //                     //                       color: Colors.white,
                //                     //                     )
                //                     //             ],
                //                     //           ),
                //                     //         ))
                //                     //     : widget.pastFollowUps
                //                     //         ?
                //                     RoundedCornerButton(
                //                       width: getSize(102),
                //                       height: getSize(32),
                //                       borderRadius: BorderRadius.all(Radius.circular(getSize(26))),
                //                       onPressed: () {
                //                         print(DateTime.now().toString());
                //                         print(DateFormat('dd MMM yyyy / HH:mm aaa')
                //                             .format(DateTime.fromMillisecondsSinceEpoch(
                //                                 int.parse(folloUpListData[index].folloUpStartTimestamp.toString())))
                //                             .toString());
                //                         print("FOllo up status : " + folloUpListData[index].folloUpStatus.toString());
                //                         if (widget.upcomingFolloUps) {
                //                           if (widget.inProgressCount > 0 &&
                //                               DateTime.now().isSameDate(DateTime.fromMillisecondsSinceEpoch(
                //                                   int.parse(folloUpListData[index].folloUpStartTimestamp.toString())))) {
                //                             AwesomeDialog(
                //                                 context: context,
                //                                 dialogType: DialogType.INFO,
                //                                 animType: AnimType.TOPSLIDE,
                //                                 dismissOnTouchOutside: false,
                //                                 headerAnimationLoop: false,
                //                                 title: 'INFO',
                //                                 btnCancelText: "Cancel",
                //                                 btnOkText: "Continue",
                //                                 desc:
                //                                     "Please complete follo up that is currently in-progress then you can start this follo, Press Continue to proceed with it",
                //                                 btnOkOnPress: () {
                //                                   Navigator.of(context)
                //                                       .pushNamedAndRemoveUntil(MainScreen.route, (Route<dynamic> route) => false);
                //                                 },
                //                                 btnCancelOnPress: () {})
                //                               ..show();
                //                             return;
                //                           } else if (widget.inProgressCount == 0 &&
                //                               DateTime.now().isSameDate(DateTime.fromMillisecondsSinceEpoch(
                //                                   int.parse(folloUpListData[index].folloUpStartTimestamp.toString())))) {
                //                             Navigator.push(
                //                                 context,
                //                                 MaterialPageRoute(
                //                                     builder: (BuildContext context) => PatientChatScreen(
                //                                           folloUpId: folloUpListData[index].folloUpId,
                //                                           conversationId: folloUpListData[index].conversationId.toString(),
                //                                         ))).then((value) {
                //                               _setDateToDatePicker();
                //                             });
                //                           } else {
                //                             return;
                //                           }
                //                         } else if (widget.currentlyWorkInProgress || widget.pastFollowUps) {
                //                           Navigator.push(
                //                               context,
                //                               MaterialPageRoute(
                //                                   builder: (BuildContext context) => PatientChatScreen(
                //                                         folloUpId: folloUpListData[index].folloUpId,
                //                                         conversationId: folloUpListData[index].conversationId.toString(),
                //                                         enableOptions: widget.pastFollowUps ? false : true,
                //                                       ))).then((value) {
                //                             _setDateToDatePicker();
                //                           });
                //                         } else {
                //                           return;
                //                         }
                //                       },
                //                       child: Padding(
                //                         padding: EdgeInsets.only(top: getSize(4), bottom: getSize(4), left: getSize(4), right: getSize(4)),
                //                         child: Row(
                //                           mainAxisAlignment: MainAxisAlignment.center,
                //                           children: [
                //                             Text(
                //                               widget.currentlyWorkInProgress
                //                                   ? 'Continue Follo'
                //                                   : widget.upcomingFolloUps
                //                                       ? "Start Follo"
                //                                       : "View Follo",
                //                               textAlign: TextAlign.center,
                //                               style: TextUtils.boldPoppinsStyle.copyWith(fontSize: getFontSize(10), color: Colors.white),
                //                             ),
                //                             SizedBox(
                //                               width: getSize(6),
                //                             ),
                //                             widget.currentlyWorkInProgress
                //                                 ? Icon(
                //                                     Icons.keyboard_arrow_right,
                //                                     color: Colors.white,
                //                                     size: getSize(20),
                //                                   )
                //                                 : widget.upcomingFolloUps
                //                                     ? Image.asset(
                //                                         ImageConstants.startFolloIcon,
                //                                         height: getSize(22),
                //                                         width: getSize(26),
                //                                         color: Colors.white,
                //                                       )
                //                                     : Image.asset(
                //                                         ImageConstants.viewFollo,
                //                                         height: getSize(22),
                //                                         width: getSize(22),
                //                                         color: Colors.white,
                //                                       )
                //                           ],
                //                         ),
                //                       ),
                //                     )
                //                     // : Container(),
                //                   ],
                //                 ),
                //                 Align(
                //                   alignment: Alignment.centerLeft,
                //                   child: Text(
                //                     DateFormat('dd MMM yyyy')
                //                         .format(DateTime.fromMillisecondsSinceEpoch(
                //                             int.parse(folloUpListData[index].folloUpStartTimestamp.toString())))
                //                         .toString(),
                //                     textAlign: TextAlign.start,
                //                     style: TextUtils.mediumPoppinsStyle.copyWith(fontSize: getFontSize(10), color: Colors.grey),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
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
