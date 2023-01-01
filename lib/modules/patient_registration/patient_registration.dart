import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:follo_patient_app/modules/home/main_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/common_widgets.dart';
import 'package:follo_patient_app/utils/custom_card.dart';
import 'package:follo_patient_app/utils/decoration_utils.dart';
import 'package:follo_patient_app/utils/error_handler.dart';
import 'package:follo_patient_app/utils/gcloud_util.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_html/html.dart' as html;
import 'package:video_player/video_player.dart';

class CreateFolloPatientPage extends StatefulWidget {
  static String route = '/reg';
  final String clinicId;
  final String careTeamId;
  final String caregiverId;

  const CreateFolloPatientPage({
    Key key,
    @required this.clinicId,
    @required this.careTeamId,
    @required this.caregiverId,
  }) : super(key: key);

  @override
  State<CreateFolloPatientPage> createState() => _CreateFolloPatientPageState();
}

class _CreateFolloPatientPageState extends State<CreateFolloPatientPage> {
  ThemeUtils theme = ThemeUtils();
  bool readOnly = false;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _wpNumberController = TextEditingController();

  TextEditingController _editPatientFirstNameController = TextEditingController();
  TextEditingController _editPatientLastNameController = TextEditingController();
  TextEditingController _editPatientAgeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _newPatientFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _editPatientFormKey = GlobalKey<FormState>();

  CaregiverInfoResponse caregiverInfoResponse = CaregiverInfoResponse();
  String clinicName = '';
  String careTeamName = '';
  FocusNode wpNumberFocusNode = FocusNode();
  String selectedCountryCode = '+91';
  String fullMobileNumber = '';
  String genderValue = 'Male';
  String _editPatientGenderValue = 'Male';
  HttpService httpService = locator<HttpService>();
  GcloudUtil gcloudUtil = locator<GcloudUtil>();

  List<MultiplePatient> patientDataList = [];
  // MultiplePatient? selectedMultiplePatient = MultiplePatient();
  FetchMultiplePatientResponse fetchMultiplePatientResponse = FetchMultiplePatientResponse();
  int selectedPatient = -1;
  int expandPatient = -1;
  // List<PlatformFile> attachmentFiles = [];
  bool _attachmentError = false;
  GlobalData globalData = locator<GlobalData>();
  List<Media> uploadedFiles = [];
  bool fileImgUploadError = false;
  bool allowMediaUpload = false;
  // String url = 'http://www.foo.com/somepath?clinic_id=value1&careteam_id=value2&caregiver_id=value3';
  String clinicId;
  String careTeamId;
  String caregiverId;
  String patientProfileId;

  /// ADD NEW PATIENT
  String patientGenderValue = 'Male';
  TextEditingController _patientFirstNameController = TextEditingController();
  TextEditingController _patientLastNameController = TextEditingController();
  TextEditingController _patientAgeController = TextEditingController();

  List<dynamic> tempAssetFiles = [];
  // List<dynamic> tempFiles = [];
  dynamic _pickImageError;
  bool isVideo = false;
  VideoPlayerController _controller;
  final ImagePicker _picker = ImagePicker();

  bool verified = false;

  @override
  void initState() {
    fetchQueryParamsAndGetData();
    initialApiCall();
    super.initState();
  }

  initialApiCall() {
    _wpNumberController.text = Preference.shared.getMobileNumber().toString();
    fullMobileNumber = "+91" + _wpNumberController.text.toString();
    setState(() {});
    fetchMultiplePatientDetails();
  }

  fetchQueryParamsAndGetData() async {
    Uri uri = await Uri.dataFromString(devURL); //converts string to a uri
    setState(() {
      Map<String, String> params = uri.queryParameters; // query parameters automatically populated
      clinicId = params['ci'];
      careTeamId = params['cti'];
      caregiverId = params['cgi'];
    });
    await caregiverInfo();
  }

  /// FOR TESTING PURPOSE ONLY
  String devURL = 'http://localhost:1234/#/reg?ci=9900a7d4ee00472e8a813aa7c1ac00ae&cti=923d0110a1994097af62c90b5b42d0c1&cgi=65ffc8381de047898f76ca77e7007ced';
  // String prodURL = 'http://localhost:1234/#/reg?ci=30085aac91a94dde8bf858c9b378d836&cti=026e666e47054300a5306d75087ff31e&cgi=02dff9ddec1e4478b1e12d36c4bb501b';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            RegistrationDetailHeader(
              clinicName: clinicName,
              profileUrl: caregiverInfoResponse.profilePicture.url,
              name: caregiverInfoResponse.name,
              degree: caregiverInfoResponse.qualifications,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                width: size.width,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.all(getSize(16)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Thank You for visiting the Clinic',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: theme.poppinsSemibold,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: ColorUtils.headerColor,
                            ),
                          ),
                          SizedBox(height: 16),

                          /// Mobile Number
                          mobileNumberField(context),
                          SizedBox(height: getSize(16)),

                          /// First Name, Last Name, Age, Gender
                          Row(
                            children: [
                              Expanded(
                                child: CommonTextField(
                                  title: 'First Name (ex. Narsimha)',
                                  maxWidth: size.width,
                                  readOnly: readOnly,
                                  labelText: 'Enter First Name',
                                  textInputAction: TextInputAction.next,
                                  controller: _firstNameController,
                                  validator: (value) {
                                    if (value != null && value.trim().isEmpty) {
                                      return 'Please enter first name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: CommonTextField(
                                  title: 'Last Name (ex. G)',
                                  maxWidth: size.width,
                                  readOnly: readOnly,
                                  textInputAction: TextInputAction.next,
                                  labelText: 'Enter Last Name',
                                  controller: _lastNameController,
                                  validator: (value) {
                                    if (value != null && value.trim().isEmpty) {
                                      return 'Please enter last name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: getSize(16)),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CommonTextField(
                                  title: 'Age',
                                  labelText: 'Enter Age',
                                  readOnly: readOnly,
                                  textInputAction: TextInputAction.done,
                                  maxWidth: size.width,
                                  textInputType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  maxLength: 3,
                                  controller: _ageController,
                                  validator: (value) {
                                    if (value != null && value.trim().isEmpty) {
                                      return 'Please enter age';
                                    } else if (int.parse(value) < 1 || int.parse(value) > 150) {
                                      return 'The age must be between 1 and 150';
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (String val) async {},
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: DropDownWidget<String>(
                                  title: 'Gender',
                                  hintText: 'Select Gender',
                                  value: genderValue,
                                  readOnly: readOnly,
                                  maxWidth: size.width,
                                  items: <String>['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: theme.poppinsSemibold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (val) async {
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    setState(() {
                                      genderValue = val;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Do you have any Old prescription / reports to share with the Doctor?',
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: theme.poppinsSemibold,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: ColorUtils.headerColor,
                                    ),
                                  ),
                                ),
                                FlutterSwitch(
                                  activeText: "",
                                  inactiveText: "",
                                  value: allowMediaUpload,
                                  valueFontSize: 10.0,
                                  width: 34,
                                  toggleSize: 10,
                                  borderRadius: 20.0,
                                  height: 18,
                                  showOnOff: false,
                                  activeColor: theme.themeBlue,
                                  inactiveColor: Colors.grey.shade300,
                                  onToggle: (val) {
                                    FocusScope.of(context).requestFocus(FocusNode());
                                    setState(() {
                                      allowMediaUpload = val;
                                      tempAssetFiles.clear();
                                      _attachmentError = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 100),
                            child: Visibility(
                              visible: allowMediaUpload,
                              child: SizedBox(
                                width: size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomCard(
                                      child: Stack(
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(
                                              minHeight: getSize(56),
                                              maxHeight: getSize(56),
                                            ),
                                            decoration: DecorationUtils.customBoxDecoration.copyWith(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(width: 1, color: Color.fromRGBO(222, 222, 223, 1)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromRGBO(0, 0, 0, 0),
                                                  blurRadius: getSize(30),
                                                  offset: Offset(
                                                    getSize(2),
                                                    getSize(10),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: tempAssetFiles.length,
                                                    itemBuilder: (context, index) {
                                                      return Padding(
                                                        padding: EdgeInsets.only(right: getSize(8)),
                                                        child: Container(
                                                          child: Stack(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {},
                                                                child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(6),
                                                                  child: Container(
                                                                      height: getSize(56),
                                                                      width: getSize(56),
                                                                      child: tempAssetFiles[index] is XFile
                                                                          ? ['jpg', 'png', 'gif', 'jpeg'].contains((tempAssetFiles[index] as XFile)
                                                                                  .path
                                                                                  .toString()
                                                                                  .substring(
                                                                                      (tempAssetFiles[index] as XFile).path.toString().lastIndexOf(".") + 1))
                                                                              ? Image.file(File(tempAssetFiles[index].path), fit: BoxFit.cover)
                                                                              : Container()
                                                                          : Container(
                                                                              decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(6),
                                                                                  border: Border.all(
                                                                                    width: 1.0,
                                                                                    color: ColorUtils.primaryColor,
                                                                                  )),
                                                                              child: ['jpg', 'png', 'gif', 'jpeg']
                                                                                      .contains(tempAssetFiles[index].extension.toLowerCase())
                                                                                  ? Image.file(File(tempAssetFiles[index].path), fit: BoxFit.cover)
                                                                                  : Image.asset(
                                                                                      ['mp4', 'mov', 'wmv', 'flv', 'avi', 'mkv', 'webm']
                                                                                              .contains(tempAssetFiles[index].extension.toLowerCase())
                                                                                          ? ImageConstants.videoImage
                                                                                          : ['m4a', 'flac', 'mp3', 'wav', 'wma', 'aac', 'ogg']
                                                                                                  .contains(tempAssetFiles[index].extension.toLowerCase())
                                                                                              ? ImageConstants.audioImage
                                                                                              : ImageConstants.pdfIcon,
                                                                                      color: ColorUtils.primaryColor,
                                                                                    ),
                                                                            )),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                right: getSize(4),
                                                                top: getSize(4),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    tempAssetFiles.removeAt(index);
                                                                    setState(() {});
                                                                    print(tempAssetFiles);
                                                                  },
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(30),
                                                                      color: Colors.red,
                                                                    ),
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(3.0),
                                                                      child: Image.asset(ImageConstants.icCancel, color: Colors.white, width: 10),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Row(
                                              children: [
                                                // Browse the documents
                                                tempAssetFiles.length < 3
                                                    ? InkWell(
                                                        onTap: () async {
                                                          await buildBottomSheet(context);
                                                          print(tempAssetFiles.length);
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: ColorUtils.primaryColor),
                                                          height: getSize(56),
                                                          width: getSize(80),
                                                          child: Center(
                                                            child: Text("Browse",
                                                                textAlign: TextAlign.center,
                                                                style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                                                  fontSize: getFontSize(12),
                                                                  color: Colors.white,
                                                                )),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),

                                                // if ((tempFiles.length + tempAssetFiles.length) >= 1)
                                                // SizedBox(
                                                //   width: getSize(16),
                                                // ),

                                                // Send button
                                                // (tempFiles.length + tempAssetFiles.length) >= 1
                                                //     ? Padding(
                                                //         padding: EdgeInsets.only(right: getSize(8)),
                                                //         child: InkWell(
                                                //           onTap: () async {
                                                //             // await convoProvider.onMessageResponseApiCall(widget.conversationId, tempMessage, tempOptions,
                                                //             //     imageList: tempAssetFiles, context: context);
                                                //             // WidgetsBinding.instance?.addPostFrameCallback((_) => _scrollToBottom());

                                                //             // setState(() {
                                                //             //   showMediaSelection = false;
                                                //             // });
                                                //           },
                                                //           child: Container(
                                                //             color: Colors.transparent,
                                                //             height: getSize(40),
                                                //             width: getSize(46),
                                                //             child: Center(
                                                //               child: Icon(Icons.send, size: getSize(32), color: ColorUtils.primaryColor),
                                                //             ),
                                                //           ),
                                                //         ),
                                                //       )
                                                //     : Container(),
                                              ],
                                            ),
                                          ),
                                          // : Container(),
                                        ],
                                      ),
                                    ),
                                    // Stack(
                                    //   children: [
                                    //     Container(
                                    //       decoration: BoxDecoration(
                                    //         borderRadius: BorderRadius.circular(5),
                                    //         border: Border.all(width: 1, color: Color.fromRGBO(222, 222, 223, 1)),
                                    //         boxShadow: [
                                    //           BoxShadow(
                                    //             color: Colors.white,
                                    //             spreadRadius: 2,
                                    //             blurRadius: 30,
                                    //             offset: Offset(2, 10),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //       width: size.width,
                                    //       height: 47,
                                    //       child: attachmentFiles.isEmpty
                                    //           ? Column(
                                    //               mainAxisAlignment: MainAxisAlignment.center,
                                    //               crossAxisAlignment: CrossAxisAlignment.start,
                                    //               children: [
                                    //                 Padding(
                                    //                   padding: const EdgeInsets.only(left: 10.0),
                                    //                   child: Text(
                                    //                     'Upload Here',
                                    //                     overflow: TextOverflow.ellipsis,
                                    //                     style: TextStyle(
                                    //                       color: ColorUtils.hintTextColor,
                                    //                       fontFamily: theme.poppinsRegular,
                                    //                       fontWeight: FontWeight.w400,
                                    //                       fontSize: getFontSize(11),
                                    //                     ),
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //             )
                                    //           : ListView.builder(
                                    //               shrinkWrap: true,
                                    //               itemCount: tempAssetFiles.length,
                                    //               scrollDirection: Axis.horizontal,
                                    //               itemBuilder: (context, index) {
                                    //                 return Stack(
                                    //                   children: [
                                    //                     Padding(
                                    //                       padding: const EdgeInsets.only(left: 6, top: 8, bottom: 6, right: 8.0),
                                    //                       child: ClipRRect(
                                    //                         borderRadius: BorderRadius.circular(6),
                                    //                         child: ['jpg', 'png', 'gif', 'jpeg'].contains(tempAssetFiles[index].extension.toLowerCase())
                                    //                             ? Image.memory(
                                    //                                 Uint8List.fromList(attachmentFiles[index].bytes.cast<int>()),
                                    //                                 width: 34,
                                    //                                 height: 34,
                                    //                                 fit: BoxFit.cover,
                                    //                                 frameBuilder: ((context, child, frame, wasSynchronouslyLoaded) {
                                    //                                   if (wasSynchronouslyLoaded) return child;
                                    //                                   return AnimatedSwitcher(
                                    //                                     duration: const Duration(milliseconds: 100),
                                    //                                     child: frame != null
                                    //                                         ? child
                                    //                                         : Center(
                                    //                                             child: SizedBox(
                                    //                                               height: 28,
                                    //                                               width: 28,
                                    //                                               child: CircularProgressIndicator(
                                    //                                                 strokeWidth: 4,
                                    //                                                 color: ColorUtils.primaryColor,
                                    //                                               ),
                                    //                                             ),
                                    //                                           ),
                                    //                                   );
                                    //                                 }),
                                    //                               )
                                    //                             : Image.asset(
                                    //                                 ['mp4', 'mov', 'wmv', 'flv', 'avi', 'mkv', 'webm']
                                    //                                         .contains(attachmentFiles[index].extension?.toLowerCase())
                                    //                                     ? ImageConstants.videoIcon
                                    //                                     : ['m4a', 'flac', 'mp3', 'wav', 'wma', 'aac', 'ogg']
                                    //                                             .contains(attachmentFiles[index].extension?.toLowerCase())
                                    //                                         ? ImageConstants.audioIcon
                                    //                                         : ImageConstants.pdfImage,
                                    //                                 width: 34,
                                    //                                 height: 34,
                                    //                                 fit: BoxFit.cover,
                                    //                               ),
                                    //                       ),
                                    //                     ),
                                    //                     Positioned(
                                    //                       top: 5,
                                    //                       right: 5,
                                    //                       child: InkWell(
                                    //                         onTap: () {
                                    //                           setState(() {
                                    //                             attachmentFiles.removeAt(index);
                                    //                           });
                                    //                         },
                                    //                         child: Container(
                                    //                           decoration: BoxDecoration(
                                    //                             borderRadius: BorderRadius.circular(25),
                                    //                             color: theme.tableGrey,
                                    //                           ),
                                    //                           child: Image.asset(ImageConstants.icCancel, color: Colors.white, width: 12),
                                    //                         ),
                                    //                       ),
                                    //                     )
                                    //                   ],
                                    //                 );
                                    //               }),
                                    //     ),
                                    //     if (attachmentFiles.length < 3)
                                    //       Positioned(
                                    //         bottom: 0,
                                    //         right: 0,
                                    //         child: InkWell(
                                    //           onTap: () async {
                                    //             await buildBottomSheet(context);
                                    //             print(tempFiles.length);
                                    //             // FocusScope.of(context).requestFocus(FocusNode());
                                    //             // FilePickerResult result = await FilePicker.platform.pickFiles(
                                    //             //   allowMultiple: true,
                                    //             //   allowCompression: true,
                                    //             // );
                                    //             // LoadingIndicator.show(context);

                                    //             // if (result != null) {
                                    //             //   setState(() {
                                    //             //     int filesToAddCount = ((3 - attachmentFiles.length) >= result.files.length
                                    //             //         ? result.files.length
                                    //             //         : (3 - attachmentFiles.length));
                                    //             //     for (int i = 0; i < filesToAddCount; i++) {
                                    //             //       attachmentFiles.add(result.files[i]);
                                    //             //     }
                                    //             //     attachmentFiles.forEach((file) {
                                    //             //       developer.log(file.name.toString());
                                    //             //       developer.log(file.bytes.toString());
                                    //             //       developer.log(file.size.toString());
                                    //             //       developer.log(file.extension.toString());
                                    //             //     });
                                    //             //     developer.log(attachmentFiles.toString());
                                    //             //   });
                                    //             // }
                                    //             // LoadingIndicator.dismiss();
                                    //           },
                                    //           child: Container(
                                    //             decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: ColorUtils.blueTextColor),
                                    //             height: 47,
                                    //             width: getSize(70),
                                    //             child: Center(
                                    //               child: Text("Browse", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 12)),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       )
                                    //   ],
                                    // ),
                                    if (_attachmentError == true)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Text(
                                          'Please select file',
                                          style: TextStyle(color: Colors.red[800], fontSize: 12),
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        '(a) Keep your documents handy\n'
                                        '(b) Select Browse\n'
                                        '(c) Select the Camera or files\n'
                                        '(d) Take a picture of your documents\n'
                                        '(e) Select Images',
                                        style: TextStyle(
                                          height: 1.8,
                                          color: ColorUtils.darkTextColor,
                                          fontFamily: theme.poppinsRegular,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: TextButtonWidget(
                  title: "Register My Appointment",
                  height: getSize(46),
                  borderRadius: getSize(26),
                  buttonWidth: screenWidth(context) * 0.75,
                  bgColor: ColorUtils.primaryColor,
                  style: TextStyle(fontFamily: theme.poppinsSemibold, fontSize: 14, color: Colors.white, backgroundColor: ColorUtils.primaryColor),
                  onPressed: () {
                    setState(() {
                      if (allowMediaUpload && tempAssetFiles.isEmpty) {
                        _attachmentError = true;
                      } else {
                        _attachmentError = false;
                      }
                    });
                    if (_formKey.currentState.validate()) {
                      // TODO:::
                      createFolloApiCall();
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: getSize(16)),
          ],
        ),
      ),
    );
  }

  Widget mobileNumberField(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Whatsapp Number',
              style: TextStyle(
                fontFamily: theme.poppinsRegular,
                fontSize: getFontSize(12),
                fontWeight: FontWeight.w400,
                color: ColorUtils.greyTextColor,
              ),
              textAlign: TextAlign.start,
            ),
            if (patientDataList.isNotEmpty && _wpNumberController.text.length == 10)
              InkWell(
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  var result = await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => patientsListingDialog(),
                  );
                  if (result != null) {
                    prefillPatientDetails(result);
                  }
                },
                child: Text(
                  selectedPatient == -1 && readOnly ? "Select Patient" : 'Change Patient',
                  style: TextStyle(
                    fontFamily: theme.poppinsMedium,
                    fontSize: getFontSize(12),
                    fontWeight: FontWeight.w400,
                    color: ColorUtils.darkerYellowTextColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AbsorbPointer(
              absorbing: true,
              child: Container(
                height: 47,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(getSize(5.0)),
                  border: Border.all(color: Color.fromRGBO(222, 222, 223, 1)),
                ),
                child: Center(
                  child: CountryPickerDropdown(
                    initialValue: 'IN',
                    itemBuilder: (country) {
                      return Container(
                        color: Colors.transparent,
                        width: getSize(100),
                        child: Row(
                          children: <Widget>[
                            CountryPickerUtils.getDefaultFlagImage(country),
                            SizedBox(width: mWidth > 600 ? 8 : 4),
                            Text(
                              "+${country.phoneCode}",
                              style: TextStyle(
                                fontSize: mWidth > 600 ? getFontSize(11) : getFontSize(14),
                                fontFamily: theme.poppinsSemibold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    iconEnabledColor: Colors.grey,
                    selectedItemBuilder: (Country country) {
                      return Center(
                        child: Container(
                          width: getSize(50),
                          height: 90,
                          child: Center(
                            child: Text(
                              "+ " + country.phoneCode,
                              style: TextStyle(
                                fontFamily: theme.poppinsSemibold,
                                fontSize: 15,
                                color: ColorUtils.darkFontColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    icon: SizedBox(),
                    iconSize: mWidth > 600 ? 36 : 24,
                    itemFilter: null,
                    priorityList: [
                      CountryPickerUtils.getCountryByIsoCode('IN'),
                      CountryPickerUtils.getCountryByIsoCode('US'),
                    ],
                    sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                    onValuePicked: (Country country) {
                      selectedCountryCode = '+' + country.phoneCode;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(width: getSize(5.0)),
            Expanded(
              child: Container(
                width: mWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(getSize(5.0)),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value != null && value.trim().isEmpty) {
                      return 'Please Enter Mobile Number';
                    } else if (value.length < 10) {
                      return 'Please Enter Valid Mobile Number';
                    }
                    return null;
                  },
                  onChanged: (String value) async {
                    setState(() {
                      fullMobileNumber = selectedCountryCode + value;
                      selectedPatient = -1;
                      expandPatient = -1;
                      verified = false;
                    });
                    if (value.length == 10) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      await fetchMultiplePatientDetails();
                    } else {
                      clearPrefillPatientDetails();
                    }
                  },
                  controller: _wpNumberController,
                  readOnly: true,
                  focusNode: wpNumberFocusNode,
                  textInputAction: TextInputAction.next,
                  maxLength: 10,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontFamily: theme.poppinsSemibold, fontSize: 14),
                  decoration: DecorationUtils.customInputDecoration.copyWith(
                    labelText: 'Enter Whatsapp Number',
                    contentPadding: mWidth > 600 ? EdgeInsets.fromLTRB(16, 10, 10, 10) : EdgeInsets.fromLTRB(16, 0, 0, 0),
                    labelStyle: TextStyle(fontFamily: theme.poppinsRegular, color: ColorUtils.hintTextColor, fontSize: 14),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(222, 222, 223, 1))),
                    suffixIcon: verified
                        ? Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Image.asset(ImageConstants.check, height: 24, width: 24),
                          )
                        : SizedBox(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // fetchPatientDetails() async {
  //   developer.log(fullMobileNumber.toString());
  //   http.Response response = await httpService.prefillPatient(
  //     context: context,
  //     mobileNumber: fullMobileNumber,
  //     userid: caregiverId,
  //   );

  //   // print(fetchPatientResponse.toString());
  //   if (response.statusCode == 200) {
  //     FetchPatientResponse fetchPatientResponse = FetchPatientResponse();
  //     fetchPatientResponse.clear();
  //     fetchPatientResponse.mergeFromBuffer(response.bodyBytes);
  //     developer.log('response code is 200');
  //     FocusScope.of(context).unfocus();
  //     if (fetchPatientResponse.status == "invalid_patient_info") {
  //       setState(() {
  //         clearPrefillPatientDetails();
  //       });
  //     } else {
  //       setState(() {
  //         _firstNameController.text = fetchPatientResponse.patientdata.firstName;
  //         _lastNameController.text = fetchPatientResponse.patientdata.lastName;
  //         _ageController.text = fetchPatientResponse.patientdata.age.toString();
  //         genderValue = fetchPatientResponse.patientdata.gender == "male"
  //             ? "Male"
  //             : fetchPatientResponse.patientdata.gender == "female"
  //                 ? "Female"
  //                 : "Other";
  //       });
  //     }
  //   } else {
  //     developer.log('response code not 200');
  //   }
  // }

  fetchMultiplePatientDetails() async {
    developer.log(fullMobileNumber);
    LoadingIndicator.show(context);
    http.Response response = await httpService.prefillMultiplePatient(
      mobileNumber: fullMobileNumber,
      userToken: globalData.userToken,
      userid: globalData.userId,
    );
    LoadingIndicator.dismiss();
    if (response.statusCode == 200) {
      developer.log('response code is 200');
      fetchMultiplePatientResponse.clear();
      fetchMultiplePatientResponse.mergeFromBuffer(response.bodyBytes);
      FocusScope.of(context).unfocus();
      if (fetchMultiplePatientResponse.status == 'success') {
        patientDataList = fetchMultiplePatientResponse.patientdata;
        // if (patientDataList.isNotEmpty) {
        setState(() {
          verified = true;
          readOnly = true;
        });
        var selectedPatient = await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => patientsListingDialog(),
        );
        if (selectedPatient != null) {
          prefillPatientDetails(selectedPatient);
        }
        // } else {
        // _firstNameController.clear();
        // _lastNameController.clear();
        // _ageController.clear();
        // genderValue = 'Male';
        // readOnly = false;
        // var isVerified = await showDialog(
        //   context: context,
        //   barrierDismissible: false,
        //   builder: (context) => OTPDialog(mobileNumber: fullMobileNumber),
        // );
        // if (isVerified != null) {
        //   setState(() {
        //     verified = isVerified;
        //   });
        // } else {
        //   setState(() {
        //     fullMobileNumber = '';
        //     _wpNumberController.clear();
        //     verified = false;
        //   });
        // }
        // }
      } else if (fetchMultiplePatientResponse.status == "invalid_patient_info") {
        clearPrefillPatientDetails();
      } else {
        if (fetchMultiplePatientResponse.status == "auth_expired") {
          await fetchMultiplePatientDetails();
          return;
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(fetchMultiplePatientResponse.status),
            btnOkOnPress: () {},
          )..show();
        }
      }
    } else {
      developer.log('response code not 200');
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.TOPSLIDE,
        dismissOnTouchOutside: false,
        headerAnimationLoop: false,
        title: 'ERROR',
        desc: ErrorHandler().getErrorMessage('Something went wrong!'),
        btnOkOnPress: () {},
      )..show();
    }
  }

  void prefillPatientDetails(patientData) {
    setState(() {
      readOnly = true;
      _firstNameController.text = patientData.firstName;
      _lastNameController.text = patientData.lastName;
      _ageController.text = patientData.age.toString();
      genderValue = patientData.gender == "male"
          ? "Male"
          : patientData.gender == "female"
              ? "Female"
              : "Other";
      patientProfileId = patientData.patientProfileId;
    });
  }

  void clearPrefillPatientDetails() {
    setState(() {
      readOnly = false;
      _firstNameController.clear();
      _lastNameController.clear();
      _ageController.clear();
      genderValue = "Male";
      tempAssetFiles.clear();
    });
  }

  patientsListingDialog() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: StatefulBuilder(
        builder: (context, setState) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: AlertDialog(
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    color: ColorUtils.primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Spacer(),
                        Text(
                          "Select Patient",
                          style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: theme.poppinsSemibold),
                        ),
                        Spacer(),
                        Container(
                          alignment: FractionalOffset.topRight,
                          child: GestureDetector(
                            child: Icon(Icons.clear, color: Colors.white, size: 25),
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                insetPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                content: Container(
                  width: 540,
                  child: ListView(
                    //mainAxisSize: MainAxisSize.min,
                    shrinkWrap: true,
                    children: [
                      //  DialogHeader(title: 'Update doctor info', closeIcon: true),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              'Please select a patient to continue',
                              style: TextStyle(color: Colors.grey, fontSize: 13, fontFamily: theme.poppinsRegular),
                            ),
                            SizedBox(height: 30),
                            for (int i = 0; i < patientDataList.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: UserChoiceTile(
                                  name: '${patientDataList[i].firstName} ${patientDataList[i].lastName}',
                                  isSelected: selectedPatient == i + 1,
                                  editForm: editPatientView(patientDataList[i]),
                                  isExpanded: expandPatient == i + 1,
                                  onTap: () {
                                    setState(() {
                                      selectedPatient = i + 1;
                                    });
                                    Navigator.pop(context, patientDataList[i]);
                                  },
                                  editOnTap: () {
                                    setState(() {
                                      var data = patientDataList[i];
                                      expandPatient = i + 1;
                                      _editPatientFirstNameController.text = data.firstName;
                                      _editPatientLastNameController.text = data.lastName;
                                      _editPatientAgeController.text = data.age.toString();
                                      _editPatientGenderValue = data.gender == "male"
                                          ? "Male"
                                          : data.gender == "female"
                                              ? "Female"
                                              : "Other";
                                      patientProfileId = data.patientProfileId;
                                    });
                                  },
                                  cancelOnTap: () {
                                    setState(() {
                                      expandPatient = -1;
                                    });
                                  },
                                ),
                              ),
                            if (patientDataList.length < 4)
                              Column(
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    'OR',
                                    style: TextStyle(color: Colors.grey, fontSize: 13, fontFamily: theme.poppinsRegular),
                                  ),
                                  SizedBox(height: 20),
                                  InkWell(
                                    onTap: () async {
                                      setState(() {
                                        _patientFirstNameController.clear();
                                        _patientLastNameController.clear();
                                        _patientAgeController.clear();
                                        patientGenderValue = 'Male';
                                      });
                                      await showDialog(
                                        context: context,
                                        builder: (context) => addPatientsDialog(),
                                      ).then((patient) {
                                        if (patient != null) {
                                          setState(() {
                                            // print(patient);
                                            patientDataList.add(
                                              MultiplePatient(
                                                mobileNumber: patient.mobileNumber,
                                                firstName: patient.firstName,
                                                lastName: patient.lastName,
                                                age: patient.age,
                                                gender: patient.gender,
                                              ),
                                            );
                                          });
                                        }
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(ImageConstants.add, height: 24, width: 24, fit: BoxFit.contain),
                                        SizedBox(width: 14),
                                        Text(
                                          'Add New Patient',
                                          style: TextStyle(color: theme.themeBlue, fontSize: 17, fontFamily: theme.poppinsMedium),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }

  editPatientView(MultiplePatient data) {
    var size = MediaQuery.of(context).size;
    double spacingHeight = 8;
    return StatefulBuilder(builder: (context, setState) {
      return Form(
        key: _editPatientFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ListView(
            shrinkWrap: true,
            children: [
              CommonTextField(
                title: 'First Name',
                labelText: 'Enter First Name',
                maxWidth: size.width,
                controller: _editPatientFirstNameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              SizedBox(height: spacingHeight),
              CommonTextField(
                title: 'Last Name',
                labelText: 'Enter Last Name',
                maxWidth: size.width,
                controller: _editPatientLastNameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: spacingHeight),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CommonTextField(
                      title: 'Age',
                      labelText: 'Enter Age',
                      maxWidth: size.width,
                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                      controller: _editPatientAgeController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter age';
                        }
                        return null;
                      },
                      onFieldSubmitted: (String val) async {},
                    ),
                  ),
                  SizedBox(width: 23),
                  Expanded(
                    child: DropDownWidget<String>(
                      title: 'Gender',
                      hintText: 'Select Gender',
                      value: _editPatientGenderValue,
                      maxWidth: size.width,
                      validator: (value) {
                        if (value == null) {
                          return 'Please select Gender';
                        }
                        return null;
                      },
                      items: <String>['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontFamily: theme.poppinsRegular),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) async {
                        setState(() {
                          _editPatientGenderValue = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButtonWidget(
                      bgColor: Color(0xffc3c8d6),
                      title: 'Cancel',
                      fontColor: Colors.black,
                      onPressed: () async {
                        expandPatient = 0;
                        Navigator.pop(context);
                        await fetchMultiplePatientDetails();
                      },
                    ),
                  ),
                  SizedBox(width: 23),
                  Expanded(
                    child: TextButtonWidget(
                      title: "Save",
                      onPressed: () async {
                        if (_editPatientFormKey.currentState.validate()) {
                          await editPatientProfileFolloApiCall(data);
                          setState(() {
                            expandPatient = 0;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  addPatientsDialog() {
    var size = MediaQuery.of(context).size;
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 540, maxHeight: 460),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DialogHeader(title: 'Add New Patient', fontSize: 16, closeIcon: true),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    child: Form(
                      key: _newPatientFormKey,
                      child: Column(
                        children: [
                          CommonTextField(
                            title: 'First Name',
                            labelText: 'Enter First Name',
                            maxWidth: size.width,
                            textInputAction: TextInputAction.next,
                            controller: _patientFirstNameController,
                            validator: (value) {
                              if (value != null && value.trim().isEmpty) {
                                return 'Please enter first name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 6),
                          CommonTextField(
                            title: 'Last Name',
                            labelText: 'Enter Last Name',
                            maxWidth: size.width,
                            textInputAction: TextInputAction.next,
                            controller: _patientLastNameController,
                            validator: (value) {
                              if (value != null && value.trim().isEmpty) {
                                return 'Please enter last name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 6),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CommonTextField(
                                  title: 'Age',
                                  labelText: 'Enter Age',
                                  maxWidth: size.width,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  maxLength: 3,
                                  controller: _patientAgeController,
                                  validator: (value) {
                                    if (value != null && value.trim().isEmpty) {
                                      return 'Please enter age';
                                    } else if (int.parse(value) < 1 || int.parse(value) > 150) {
                                      return 'The age must be between 1 and 150';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: DropDownWidget<String>(
                                  title: 'Gender',
                                  hintText: 'Select Gender',
                                  value: patientGenderValue,
                                  maxWidth: size.width,
                                  items: <String>['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontFamily: theme.poppinsRegular),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (val) async {
                                    setState(() {
                                      patientGenderValue = val;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextButtonWidget(
                                  bgColor: Color(0xffc3c8d6),
                                  title: 'Cancel',
                                  fontColor: Colors.black,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextButtonWidget(
                                  title: "Add",
                                  onPressed: () async {
                                    if (_newPatientFormKey.currentState.validate()) {
                                      await addNewPatientApiCall();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

// TODO:
  caregiverInfo() async {
    // LoadingIndicator.show(context);
    http.Response response = await httpService.caregiverInfo(
      userId: globalData.userId,
      userToken: globalData.userToken,
      clinicId: clinicId,
      careteamId: careTeamId,
      caregiverId: caregiverId,
    );
    // LoadingIndicator.dismiss();
    if (response.statusCode == 200) {
      CaregiverInfoResponse _caregiverInfoResponse = CaregiverInfoResponse();
      _caregiverInfoResponse.mergeFromBuffer(response.bodyBytes);
      if (_caregiverInfoResponse.status == 'success') {
        print(_caregiverInfoResponse.toString());
        caregiverInfoResponse = _caregiverInfoResponse;
        setState(() {});
      } else {
        if (_caregiverInfoResponse.status == 'auth_expired') {
          await caregiverInfo();
          return;
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(_caregiverInfoResponse.status),
            btnOkOnPress: () {},
          )..show();
        }
      }
    } else {
      developer.log('response code not 200');
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

  openFilePickerForMedicalFiles() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: false);
    if (result != null) {
      tempAssetFiles.add(result.files.first);
    }
    setState(() {});
    // if (tempAssetFiles.length >= 1) {
    //   setState(() {
    //     fileImgUploadError = false;
    //   });
    // } else {
    //   setState(() {
    //     fileImgUploadError = true;
    //   });
    // }
    print(tempAssetFiles);
  }

  Future buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 160.0,
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
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          // The OS restricts access, for example because of parental controls.

                          if (await Permission.camera.request().isGranted) {
                            // openImagePickerForMedicalFiles();
                            _onImageButtonPressed(ImageSource.camera, context: context);
                            Navigator.pop(context);
                          } else if (await Permission.camera.request().isPermanentlyDenied) {
                            print("permission denided");
                            AwesomeDialog(
                                context: context,
                                dialogType: DialogType.INFO,
                                animType: AnimType.TOPSLIDE,
                                dismissOnTouchOutside: true,
                                headerAnimationLoop: false,
                                title: 'Permission not granted!',
                                desc: "You need to allow camera option by clicking on Open Settings button.",
                                btnOkOnPress: () {
                                  openAppSettings();
                                },
                                btnOkText: "Open Settings",
                                btnCancelOnPress: () {})
                              ..show();
                          } else {}
                        },
                        child: Container(
                          height: getSize(100),
                          width: getSize(100),
                          decoration: BoxDecoration(
                            color: ColorUtils.primaryColor,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Icon(
                            Icons.photo,
                            size: getSize(40),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getSize(10),
                      ),
                      Text(
                        "Camera",
                        style: TextUtils.regularPoppinsStyle.copyWith(
                          fontSize: getFontSize(14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: getSize(50.0),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          openFilePickerForMedicalFiles();
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: getSize(100),
                          width: getSize(100),
                          decoration: BoxDecoration(
                            color: ColorUtils.primaryColor,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Icon(
                            Icons.insert_drive_file_outlined,
                            size: getSize(40),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getSize(10),
                      ),
                      Text(
                        "Documents",
                        style: TextUtils.regularPoppinsStyle.copyWith(
                          fontSize: getFontSize(14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext context, bool isMultiImage = false}) async {
    // List<Asset> tempList = [];

    if (_controller != null) {
      await _controller.setVolume(0.0);
    }
    if (isVideo) {
      // final XFile file = await _picker.pickVideo(
      //     source: source, maxDuration: const Duration(seconds: 10));
      // await _playVideo(file);
    } else if (isMultiImage) {
      // await _displayPickImageDialog(context,
      //     (double maxWidth, double maxHeight, int quality) async {
      try {
        final pickedFileList = await _picker.pickMultiImage();
        for (var i = 0; i < pickedFileList.length; i++) {
          // if (tempAssetFiles != pickedFileList) {
          tempAssetFiles.add(pickedFileList);
          // }
        }

        setState(() {});
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
      // });
    } else {
      // await _displayPickImageDialog(context,
      //     (double maxWidth, double maxHeight, int quality) async {
      try {
        final pickedFile = await _picker.pickImage(
          source: source,
          // maxWidth: maxWidth,
          // maxHeight: maxHeight,
          // imageQuality: quality,
        );
        if (pickedFile != null) {
          setState(() {
            tempAssetFiles.add(pickedFile);
          });
        }
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
      // });
    }
  }

  // TODO::
  createFolloApiCall() async {
    if (allowMediaUpload && tempAssetFiles.isNotEmpty) {
      for (var i = 0; i < tempAssetFiles.length; i++) {
        if (tempAssetFiles[i] is PlatformFile) {
          LoadingIndicator.show(context);
          var response = await _uploadImage(
            name: globalData.userId + DateTime.now().millisecondsSinceEpoch.toString() + '.' + tempAssetFiles[i].extension,
            imageBytes: File((tempAssetFiles[i] as PlatformFile).path).readAsBytesSync(),
          );
          LoadingIndicator.dismiss();

          if (response != null) {
            print(response.downloadLink);
            Media attachments = Media();
            attachments.url = response.downloadLink.toString();
            attachments.mediaType = tempAssetFiles[i].extension;
            attachments.fileName = tempAssetFiles[i].name;
            uploadedFiles.add(attachments);
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.TOPSLIDE,
              dismissOnTouchOutside: false,
              headerAnimationLoop: false,
              title: 'ERROR',
              desc: "Error uploading attachment files, please try again.",
              btnOkOnPress: () {},
            )..show();
          }
        } else {
          // print(tempAssetFiles[i].getByteData());
          // ByteData medicalData = await tempAssetFiles[i].getByteData();
          String extension = tempAssetFiles[i].name.toString().substring(tempAssetFiles[i].name.lastIndexOf(".") + 1);
          String name = tempAssetFiles[i].name.toString().substring(0, tempAssetFiles[i].name.lastIndexOf("."));
          LoadingIndicator.show(context);
          var response = await _uploadImage(
            name: globalData.userId + DateTime.now().millisecondsSinceEpoch.toString() + '.' + extension,
            imageBytes: File((tempAssetFiles[i] as XFile).path).readAsBytesSync(),
          );
          LoadingIndicator.dismiss();
          if (response != null) {
            Media attachments = Media();
            attachments.url = response.downloadLink.toString();
            attachments.mediaType = extension;
            attachments.fileName = name;
            uploadedFiles.add(attachments);
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.TOPSLIDE,
              dismissOnTouchOutside: false,
              headerAnimationLoop: false,
              title: 'ERROR',
              desc: "Error uploading attachment files, please try again.",
              btnOkOnPress: () {},
            )..show();
          }
        }
        // LoadingIndicator.show(context);
        // var response = await _uploadImage(
        //   name: caregiverId.toString() + DateTime.now().millisecondsSinceEpoch.toString() + '.' + tempAssetFiles[i].extension,
        //   imageBytes: tempAssetFiles[i].bytes,
        // );
        // LoadingIndicator.dismiss();
        // setState(() {
        //   if (response != null) {
        //     Media attachments = Media();
        //     // print(response.downloadLink);
        //     attachments.url = response.downloadLink.toString();
        //     attachments.mediaType = tempAssetFiles[i].extension;
        //     attachments.fileName = tempAssetFiles[i].name;

        //     uploadedFiles.add(attachments);
        //     fileImgUploadError = false;
        //   } else {
        //     fileImgUploadError = true;
        //     AwesomeDialog(
        //       context: context,
        //       dialogType: DialogType.ERROR,
        //       animType: AnimType.TOPSLIDE,
        //       dismissOnTouchOutside: false,
        //       headerAnimationLoop: false,
        //       title: 'ERROR',
        //       desc: ErrorHandler().getErrorMessage('Error on uploading attachments, please try again'),
        //       btnOkOnPress: () {},
        //     )..show();
        //   }
        // });
      }
    }
    if (fileImgUploadError == true) {
      return;
    } else {
      print(uploadedFiles.length);
      LoadingIndicator.show(context);
      http.Response response = await httpService.createFolloUp(
        userid: globalData.userId ?? '',
        userToken: globalData.userToken ?? "",
        clinicId: clinicId ?? '',
        careTeamId: careTeamId ?? '',
        mobileNumber: fullMobileNumber,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        age: int.parse(_ageController.text),
        gender: genderValue.toLowerCase(),
        attachments: uploadedFiles,
        patientProfileId: patientProfileId ?? "",
      );
      LoadingIndicator.dismiss();

      // print(response.statusCode.toString());
      if (response.statusCode == 200) {
        UndiagnosisCreateFolloUpResponse undiagnosisCreateFolloUpResponse = UndiagnosisCreateFolloUpResponse();
        undiagnosisCreateFolloUpResponse.mergeFromBuffer(response.bodyBytes);
        developer.log(undiagnosisCreateFolloUpResponse.toString());
        developer.log('response code is 200');
        developer.log("create follo api response status : " + undiagnosisCreateFolloUpResponse.status);

        if (undiagnosisCreateFolloUpResponse.status == "success") {
          AwesomeDialog(
            dismissOnBackKeyPress: false,
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'Appointment Registered!',
            desc: "Your Appointment is Registered successfully, I will see you soon.",
            btnOkOnPress: () {
              Navigator.of(context).pushNamedAndRemoveUntil(MainScreen.route, (Route<dynamic> route) => false);
            },
          )..show();
        } else {
          if (undiagnosisCreateFolloUpResponse.status == "auth_expired") {
            await createFolloApiCall();
            return;
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.TOPSLIDE,
              dismissOnTouchOutside: false,
              headerAnimationLoop: false,
              title: 'ERROR',
              desc: ErrorHandler().getErrorMessage(undiagnosisCreateFolloUpResponse.status),
              btnOkOnPress: () {},
            )..show();
          }
        }
        setState(() {});
      } else {
        developer.log('response code not 200');
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.TOPSLIDE,
          dismissOnTouchOutside: false,
          headerAnimationLoop: false,
          title: 'ERROR',
          desc: ErrorHandler().getErrorMessage('Something went wrong!'),
          btnOkOnPress: () {},
        )..show();
      }
    }
  }

  addNewPatientApiCall() async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.addNewPatient(
      userid: globalData.userId ?? '',
      userToken: globalData.userToken ?? '',
      mobileNumber: fullMobileNumber,
      firstName: _patientFirstNameController.text,
      lastName: _patientLastNameController.text,
      age: int.parse(_patientAgeController.text),
      gender: patientGenderValue.toLowerCase(),
    );
    LoadingIndicator.dismiss();

    if (response.statusCode == 200) {
      AddPatientProfileResponse addPatientProfileResponse = AddPatientProfileResponse();
      addPatientProfileResponse.mergeFromBuffer(response.bodyBytes);
      developer.log(addPatientProfileResponse.toString());

      developer.log('addPatientProfile Response code is 200');
      developer.log("addPatientProfileResponse status : " + addPatientProfileResponse.status);

      if (addPatientProfileResponse.status == "success") {
        Navigator.pop(context, addPatientProfileResponse.patient);
      } else if (addPatientProfileResponse.status == 'user_already_exist') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.INFO,
          animType: AnimType.TOPSLIDE,
          dismissOnTouchOutside: false,
          headerAnimationLoop: false,
          title: 'Info',
          desc: ErrorHandler().getErrorMessage("Patient already exist"),
          btnOkOnPress: () {},
        )..show();
      } else {
        if (addPatientProfileResponse.status == "auth_expired") {
          await addNewPatientApiCall();
          return;
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'Error',
            desc: ErrorHandler().getErrorMessage(addPatientProfileResponse.status),
            btnOkOnPress: () {},
          )..show();
        }
      }
      setState(() {});
    } else {
      developer.log('addPatientProfile Response code not 200');
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.TOPSLIDE,
        dismissOnTouchOutside: false,
        headerAnimationLoop: false,
        title: 'Error',
        desc: ErrorHandler().getErrorMessage('Something went wrong!'),
        btnOkOnPress: () {},
      )..show();
    }
  }

  editPatientProfileFolloApiCall(MultiplePatient data) async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.editPatientProfileFollo(
      userToken: globalData.userToken,
      patientProfileId: data.patientProfileId,
      firstName: _editPatientFirstNameController.text,
      lastName: _editPatientLastNameController.text,
      gender: _editPatientGenderValue.toLowerCase(),
      age: int.parse(_editPatientAgeController.text),
      userId: caregiverId ?? '',
    );
    LoadingIndicator.dismiss();
    ;
    print("editPatientApiCall: " + response.toString());

    if (response.statusCode == 200) {
      EditPatientProfileResponse editPatientProfileResponse = EditPatientProfileResponse();
      editPatientProfileResponse.mergeFromBuffer(response.bodyBytes);
      print("editPatientApiCall: " + editPatientProfileResponse.toString());
      if (editPatientProfileResponse.status == "success") {
        openPatientCreatedDialog(context);
        setState(() {
          readOnly = true;
          _firstNameController.text = _editPatientFirstNameController.text;
          _lastNameController.text = _editPatientLastNameController.text;
          _ageController.text = _editPatientAgeController.text;
          genderValue = _editPatientGenderValue;
          expandPatient = 0;
        });
      } else {
        if (editPatientProfileResponse.status == "auth_expired") {
          await editPatientProfileFolloApiCall(data);
          return;
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'Info',
            desc: ErrorHandler().getErrorMessage(editPatientProfileResponse.status),
            btnOkOnPress: () {},
          )..show();
        }
      }
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.TOPSLIDE,
        dismissOnTouchOutside: false,
        headerAnimationLoop: false,
        title: 'Info',
        desc: ErrorHandler().getErrorMessage("Something went wrong!"),
        btnOkOnPress: () {},
      )..show();
      return;
    }
  }

  _uploadImage({@required String name, dynamic imageBytes}) async {
    print('uploading image');
    try {
      LoadingIndicator.show(context);
      final response = await gcloudUtil.uploadFile(name, imageBytes);
      LoadingIndicator.dismiss();
      ;
      return response;
    } on Exception catch (_) {
      LoadingIndicator.dismiss();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.TOPSLIDE,
        dismissOnTouchOutside: false,
        headerAnimationLoop: false,
        title: 'Info',
        desc: ErrorHandler().getErrorMessage('Error uploading image, please select diff file.'),
        btnOkOnPress: () {},
      )..show();
    }
  }

  openPatientCreatedDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
          content: Container(
            width: MediaQuery.of(context).size.width < 600 ? MediaQuery.of(context).size.width - 200 : 400.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  ImageConstants.imageVerified,
                  height: getSize(70),
                  width: getSize(70),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Patient Updated',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: theme.poppinsRegular,
                    fontSize: getFontSize(20),
                    fontWeight: FontWeight.w900,
                    color: ColorUtils.successGreenColor,
                  ),
                ),
                Text(
                  'Patient has been updated successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: theme.poppinsRegular,
                    fontSize: getFontSize(14),
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(51, 51, 51, 0.87),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(left: getSize(10), right: getSize(10)),
                  child: Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width < 400 ? MediaQuery.of(context).size.width - 300 : 200,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(theme.themeBlue),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        await fetchMultiplePatientDetails();
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontFamily: theme.poppinsRegular,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  appointmentSuccessDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
          content: Container(
            width: MediaQuery.of(context).size.width < 600 ? MediaQuery.of(context).size.width - 200 : 400.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  ImageConstants.imageVerified,
                  height: getSize(70),
                  width: getSize(70),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Appointment Created',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: theme.poppinsRegular,
                    fontSize: getFontSize(20),
                    fontWeight: FontWeight.w900,
                    color: ColorUtils.successGreenColor,
                  ),
                ),
                Text(
                  'Patient has been updated successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: theme.poppinsRegular,
                    fontSize: getFontSize(14),
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(51, 51, 51, 0.87),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(left: getSize(10), right: getSize(10)),
                  child: Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width < 400 ? MediaQuery.of(context).size.width - 300 : 200,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(theme.themeBlue),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        await fetchMultiplePatientDetails();
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontFamily: theme.poppinsRegular,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
