import 'dart:io';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:follo_patient_app/modules/auth/login_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/common/rounded_corner_buttons.dart';
import 'package:follo_patient_app/utils/common/rounded_text_buttons.dart';
import 'package:follo_patient_app/utils/custom_card.dart';
import 'package:follo_patient_app/utils/decoration_utils.dart';
import 'package:follo_patient_app/utils/error_handler.dart';
import 'package:follo_patient_app/utils/gcloud_util.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:follo_patient_app/utils/utils.dart';
import 'package:follo_patient_app/utils/validators.dart';
import 'package:follo_patient_app/utils/widgets/bouncy_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pinput/pin_put/pin_put_state.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class PatientSignupScreen extends StatefulWidget {
  static const String route = "patientSignupScreen";
  final String mobileNumber;
  final bool isForEdit;
  final Patient patient;
  const PatientSignupScreen({Key key, @required this.mobileNumber, this.isForEdit = false, this.patient}) : super(key: key);

  @override
  _PatientSignupScreenState createState() => _PatientSignupScreenState();
}

class _PatientSignupScreenState extends State<PatientSignupScreen> {
  final TextEditingController _mobileNoController = new TextEditingController();
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _birthDateController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  HttpService httpService = locator<HttpService>();
  GlobalData globalData = locator<GlobalData>();
  GcloudUtil gcloudUtil = locator<GcloudUtil>();
  dynamic profileFile;
  DateTime birthDate = DateTime.now();
  bool profileImgUploadError = false;
  String _genderValue = "Male";
  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;
  VideoPlayerController _controller;
  bool isVideo = false;
  String docText;
  String policyUrl;
  String _profilePicture;

  @override
  void initState() {
    _mobileNoController.text = widget.mobileNumber;
    if (widget.isForEdit) prefillPatientData();
    if (!widget.isForEdit) termsAndPolicyApiCall();
    super.initState();
  }

  prefillPatientData() {
    _firstNameController.text = widget.patient.firstName;
    _lastNameController.text = widget.patient.lastName;
    _genderValue = widget.patient.gender.capitalize();
    _profilePicture = widget.patient.profilePicture.url.toString();
    birthDate = DateTime.fromMillisecondsSinceEpoch(int.parse(
      widget.patient.dateOfBirth.toString(),
    ));
    print(birthDate);
    _birthDateController.text = DateFormat('dd MMM yyyy')
        .format(
          DateTime.fromMillisecondsSinceEpoch(
            int.parse(
              widget.patient.dateOfBirth.toString(),
            ),
          ),
        )
        .toString();
  }

  _uploadImage({String name, dynamic imageBytes, BuildContext context}) async {
    print('uploading image');
    try {
      final response = await gcloudUtil.uploadFile(name, imageBytes);
      print(response.downloadLink);
      return response;
    } on Exception catch (_) {
      print(_);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.TOPSLIDE,
        dismissOnTouchOutside: false,
        headerAnimationLoop: false,
        title: 'ERROR',
        desc: "Error uploading image, please select diff file.",
        btnOkOnPress: () {},
      )..show();
    }
    return null;
  }

  termsAndPolicyApiCall() async {
    http.Response response = await httpService.termsAndPolicy(platform: 'patient_app', name: 'privacy_policy');
    print("termsAndPolicy api response: " + response.toString());

    if (response.statusCode == 200) {
      TCandPPResponse tcAndPPResponse = TCandPPResponse();
      tcAndPPResponse.mergeFromBuffer(response.bodyBytes);
      if (tcAndPPResponse.status == "success") {
        policyUrl = tcAndPPResponse.url;
        setState(() {});
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

  signUpApiCall() async {
    print(globalData.userId);
    print(globalData.userToken);

    Media profilePhoto = Media();

    if (profileFile != null) {
      print('uploading image');
      try {
        if (profileFile is PlatformFile) {
          LoadingIndicator.show(context);
          var response = await _uploadImage(
            name: globalData.userId + DateTime.now().millisecondsSinceEpoch.toString() + '.' + profileFile.extension,
            imageBytes: File((profileFile as PlatformFile).path).readAsBytesSync(),
          );
          LoadingIndicator.dismiss();

          if (response != null) {
            print(response.downloadLink);
            Media attachments = Media();
            attachments.url = response.downloadLink.toString();
            attachments.mediaType = profileFile.extension;
            attachments.fileName = profileFile.name;
            profilePhoto = attachments;
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
          String extension = profileFile.name.toString().substring(profileFile.name.lastIndexOf(".") + 1);
          String name = profileFile.name.toString().substring(0, profileFile.name.lastIndexOf("."));
          LoadingIndicator.show(context);
          var response = await _uploadImage(
            name: globalData.userId + DateTime.now().millisecondsSinceEpoch.toString() + '.' + extension,
            imageBytes: File((profileFile as XFile).path).readAsBytesSync(),
          );
          LoadingIndicator.dismiss();
          if (response != null) {
            Media attachments = Media();
            attachments.url = response.downloadLink.toString();
            attachments.mediaType = extension;
            attachments.fileName = name;
            profilePhoto = attachments;
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
      } on Exception catch (_) {
        print(_);
      }
    }

    if (profileImgUploadError == true) {
      return;
    } else {
      LoadingIndicator.show(context);
      http.Response response = await httpService.patientSignup(
        usertoken: globalData.userToken,
        userid: globalData.userId,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        mobileNumber: widget.mobileNumber,
        dateOfBirth: Int64.parseInt(birthDate.millisecondsSinceEpoch.toString()),
        profilePicture: profilePhoto,
        gender: _genderValue.toString().toLowerCase(),
        role: "patient",
        clinicId: clinicId,
      );
      LoadingIndicator.dismiss();

      if (response.statusCode == 200) {
        PatientSignUpResponse patientSignUpResponse = PatientSignUpResponse();
        patientSignUpResponse.mergeFromBuffer(response.bodyBytes);
        print(patientSignUpResponse.toString());
        setState(() {});
        if (patientSignUpResponse.status == 'success') {
          if (patientSignUpResponse.signUpSuccess) {
            Preference.shared.setMobileNumber(widget.mobileNumber.toString().substring(widget.mobileNumber.length - 10));
            print(Preference.shared.getMobileNumber().toString());
            AwesomeDialog(
              dismissOnBackKeyPress: false,
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.TOPSLIDE,
              dismissOnTouchOutside: false,
              headerAnimationLoop: false,
              title: 'Sign up successful',
              desc: "Your profile as patient registered successfully.",
              btnOkOnPress: () {
                Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.route, (Route<dynamic> route) => false);
              },
            )..show();
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.TOPSLIDE,
              dismissOnTouchOutside: false,
              headerAnimationLoop: false,
              title: 'ERROR',
              desc: ErrorHandler().getErrorMessage(patientSignUpResponse.status),
              btnOkOnPress: () {},
            )..show();
          }
        } else if (patientSignUpResponse.status == 'auth_expired') {
          await signUpApiCall();
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: "Please check your details",
            btnOkOnPress: () {},
          )..show();
        }
      } else {
        print('response code not 200');
        print(response.bodyBytes.toString());
      }
    }
  }

  editProfileApiCall() async {
    print(globalData.userId);
    print(globalData.userToken);

    Media profilePhoto = Media();

    if (profileFile != null) {
      print('uploading image');
      try {
        if (profileFile is PlatformFile) {
          LoadingIndicator.show(context);
          var response = await _uploadImage(
            name: globalData.userId + DateTime.now().millisecondsSinceEpoch.toString() + '.' + profileFile.extension,
            imageBytes: File((profileFile as PlatformFile).path).readAsBytesSync(),
          );
          LoadingIndicator.dismiss();

          if (response != null) {
            print(response.downloadLink);
            Media attachments = Media();
            attachments.url = response.downloadLink.toString();
            attachments.mediaType = profileFile.extension;
            attachments.fileName = profileFile.name;
            profilePhoto = attachments;
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
          String extension = profileFile.name.toString().substring(profileFile.name.lastIndexOf(".") + 1);
          String name = profileFile.name.toString().substring(0, profileFile.name.lastIndexOf("."));
          LoadingIndicator.show(context);
          var response = await _uploadImage(
            name: globalData.userId + DateTime.now().millisecondsSinceEpoch.toString() + '.' + extension,
            imageBytes: File((profileFile as XFile).path).readAsBytesSync(),
          );
          LoadingIndicator.dismiss();
          if (response != null) {
            Media attachments = Media();
            attachments.url = response.downloadLink.toString();
            attachments.mediaType = extension;
            attachments.fileName = name;
            profilePhoto = attachments;
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
      } on Exception catch (_) {
        print(_);
      }
    }

    if (profileImgUploadError == true) {
      return;
    } else {
      print(birthDate.toString());
      print("date : " + Int64.parseInt(birthDate.millisecondsSinceEpoch.toString()).toString());
      LoadingIndicator.show(context);
      http.Response response = await httpService.editPatientProfile(
        usertoken: globalData.userToken,
        userid: globalData.userId,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        dateOfBirth: Int64.parseInt(birthDate.millisecondsSinceEpoch.toString()),
        profilePicture: profilePhoto,
        gender: _genderValue.toString().toLowerCase(),
        role: "patient",
        clinicId: clinicId,
        patientProfileId: Preference.shared.getSelectedPatientProfileId(),
      );
      print(Int64.parseInt(birthDate.millisecondsSinceEpoch.toString()));

      LoadingIndicator.dismiss();

      if (response.statusCode == 200) {
        EditProfileResponse editProfileResponse = EditProfileResponse();
        editProfileResponse.mergeFromBuffer(response.bodyBytes);
        print(editProfileResponse.toString());
        if (editProfileResponse.status == 'success') {
          if (editProfileResponse.profileUpdated) {
            AwesomeDialog(
              dismissOnBackKeyPress: false,
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.TOPSLIDE,
              dismissOnTouchOutside: false,
              headerAnimationLoop: false,
              title: 'Profile Updated',
              desc: "Your profile updated successfully.",
              btnOkOnPress: () {
                Navigator.of(context).pop();
              },
            )..show();
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.TOPSLIDE,
              dismissOnTouchOutside: false,
              headerAnimationLoop: false,
              title: 'ERROR',
              desc: ErrorHandler().getErrorMessage(editProfileResponse.status),
              btnOkOnPress: () {},
            )..show();
          }
        } else if (editProfileResponse.status == 'auth_expired') {
          await signUpApiCall();
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: "Please check your details",
            btnOkOnPress: () {},
          )..show();
        }
      } else {
        print('response code not 200');
        print(response.bodyBytes.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primaryColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getSize(40.0), vertical: getSize(20.0)),
          child: RoundedTextButton(
            text: widget.isForEdit ? "Update Profile" : 'Sign up',
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                if (widget.isForEdit) {
                  await editProfileApiCall();
                } else {
                  try {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    child: FutureBuilder<File>(
                                      future: DefaultCacheManager().getSingleFile(policyUrl),
                                      builder: (context, snapshot) => snapshot.hasData
                                          ? PdfViewer.openFile(snapshot.data.path)
                                          : Container(
                                              child: Center(
                                                child: CupertinoActivityIndicator(),
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: screenWidth(context) * 0.05),
                                  child: Text(
                                    "By clicking Agree button, I confirm that I read the privacy policy and terms and conditions, understood completely and agree to it.",
                                    textAlign: TextAlign.center,
                                    style: TextUtils.mediumPoppinsStyle.copyWith(fontSize: getFontSize(12)),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BouncyButton(
                                      onPressed: () async {
                                        await signUpApiCall();
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
                                          "Agree",
                                          style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                          "Disagree",
                                          style: TextUtils.semiBoldPoppinsStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } on Exception catch (_) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR,
                      animType: AnimType.TOPSLIDE,
                      dismissOnTouchOutside: false,
                      headerAnimationLoop: false,
                      title: 'ERROR',
                      desc: "Error while signing you up, please verify your details.",
                      btnOkOnPress: () {},
                    )..show();
                  }
                }
              }
            },
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * 0.08,
              child: Center(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: getSize(12.0)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            if (widget.isForEdit) {
                              Navigator.of(context).pop();
                            } else {
                              NavigationUtilities.pushReplacementNamed(
                                LoginScreen.route,
                              );
                            }
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: getSize(26.0),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Patient Details',
                        textAlign: TextAlign.center,
                        style: TextUtils.semiBoldPoppinsStyle.copyWith(
                          color: ColorUtils.titleTextColorWhite,
                          fontSize: getFontSize(18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Hero(
                    tag: "authContainerTag",
                    child: Material(
                      type: MaterialType.transparency,
                      child: Container(
                        width: screenWidth(context),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(getSize(24.0)),
                            topRight: Radius.circular(getSize(24.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth(context),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(screenHeight(context) * 0.04),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.isForEdit && profileFile == null && widget.patient.profilePicture.url.isNotEmpty
                                  ? Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100.0),
                                          child: Image.network(
                                            widget.patient.profilePicture.url.toString(),
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  : profileFile == null
                                      ? Center(
                                          child: CircleAvatar(
                                            radius: screenWidth(context) * 0.155,
                                            backgroundColor: profileImgUploadError ? Colors.red[800] : Colors.white,
                                            child: CircleAvatar(
                                              backgroundColor: ColorUtils.primaryColor,
                                              child: Icon(
                                                Icons.person,
                                                size: screenWidth(context) * 0.15,
                                                color: profileImgUploadError ? Colors.red[800] : Colors.white,
                                              ),
                                              radius: screenWidth(context) * 0.14,
                                            ),
                                          ),
                                        )
                                      : Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              width: 100,
                                              height: 100,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(100),
                                                child: Image.file(File(profileFile.path), fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                        ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Center(
                                child: RoundedCornerButton(
                                  onPressed: () async {
                                    await buildBottomSheet(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: screenWidth(context) * 0.05,
                                      ),
                                      SizedBox(
                                        width: screenWidth(context) * 0.024,
                                      ),
                                      Text(
                                        'Upload Profile Photo',
                                        overflow: TextOverflow.fade,
                                        style: TextUtils.regularPoppinsStyle.copyWith(
                                          fontSize: getFontSize(12),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  width: screenWidth(context) * 0.54,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight(context) * 0.02,
                              ),
                              Text(
                                'Mobile number',
                                style: TextUtils.regularPoppinsStyle.copyWith(
                                  fontSize: getFontSize(12.0),
                                  color: ColorUtils.bodyTextColorBlack,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight(context) * 0.01,
                              ),
                              TextFormField(
                                enableInteractiveSelection: false, // will disable paste operation
                                focusNode: AlwaysDisabledFocusNode(),
                                controller: _mobileNoController,
                                readOnly: true,
                                maxLength: 10,
                                textAlign: TextAlign.start,
                                style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                  fontSize: getFontSize(14.0),
                                ),
                                decoration: DecorationUtils.customInputDecoration.copyWith(
                                  fillColor: ColorUtils.disabledTextFieldColor,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight(context) * 0.02,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: 'First Name',
                                    style: TextUtils.regularPoppinsStyle.copyWith(
                                      fontSize: getFontSize(12.0),
                                      color: ColorUtils.bodyTextColorBlack,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(color: Colors.red, fontSize: 18.0),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: screenHeight(context) * 0.01,
                              ),
                              CustomCard(
                                child: TextFormField(
                                  validator: (val) => Validators.validatedbyAlphaNumeric(
                                    val,
                                    "First name",
                                  ),
                                  controller: _firstNameController,
                                  readOnly: false,
                                  onChanged: (String value) async {},
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  textAlign: TextAlign.start,
                                  style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                    fontSize: getFontSize(14.0),
                                  ),
                                  decoration: DecorationUtils.customInputDecoration.copyWith(
                                    labelText: 'Enter First Name',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight(context) * 0.02,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: 'Last Name',
                                    style: TextUtils.regularPoppinsStyle.copyWith(
                                      fontSize: getFontSize(12.0),
                                      color: ColorUtils.bodyTextColorBlack,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(color: Colors.red, fontSize: 18.0),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: screenHeight(context) * 0.01,
                              ),
                              CustomCard(
                                child: TextFormField(
                                  validator: (val) => Validators.validatedbyAlphaNumeric(
                                    val,
                                    "Last name",
                                  ),
                                  controller: _lastNameController,
                                  readOnly: false,
                                  onChanged: (String value) async {},
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  textAlign: TextAlign.start,
                                  style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                    fontSize: getFontSize(14.0),
                                  ),
                                  decoration: DecorationUtils.customInputDecoration.copyWith(
                                    labelText: 'Enter Last Name',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight(context) * 0.02,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: 'Date Of Birth',
                                    style: TextUtils.regularPoppinsStyle.copyWith(
                                      fontSize: getFontSize(12.0),
                                      color: ColorUtils.bodyTextColorBlack,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(color: Colors.red, fontSize: 18.0),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: screenHeight(context) * 0.01,
                              ),
                              CustomCard(
                                child: TextFormField(
                                  validator: (val) => Validators.validateRequired(val, "Birth Date"),
                                  controller: _birthDateController,
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime date = await _selectDate(context, birthDate);
                                    if (date != null) {
                                      birthDate = date;
                                      _birthDateController.text = DateFormat('dd MMM yyyy').format(date).toString();
                                    }
                                  },
                                  onChanged: (String value) async {},
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  textAlign: TextAlign.start,
                                  style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                    fontSize: getFontSize(14.0),
                                  ),
                                  decoration: DecorationUtils.customInputDecoration.copyWith(
                                    labelText: 'Select Birth Date',
                                    suffixIcon: Padding(
                                      padding: EdgeInsets.all(getSize(12)),
                                      child: Image.asset(
                                        ImageConstants.datePickerIcon,
                                        height: getSize(10),
                                        width: getSize(10),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight(context) * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gender',
                                    style: TextUtils.regularPoppinsStyle.copyWith(
                                      fontSize: getFontSize(12.0),
                                      color: ColorUtils.bodyTextColorBlack,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight(context) * 0.01,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color.fromRGBO(222, 222, 223, 1),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 30,
                                          offset: Offset(2, 10), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.zero,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16, right: 16),
                                      child: DropdownButtonFormField<String>(
                                        focusColor: Colors.white,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please select gender';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          fillColor: Colors.white,
                                          filled: false,
                                        ),
                                        value: _genderValue,
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: ColorUtils.dropdownColor,
                                        ),
                                        iconSize: 24,
                                        elevation: 16,
                                        hint: Text('Select Gender'),
                                        style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                          fontSize: getFontSize(14.0),
                                        ),
                                        onChanged: (String newValue) async {
                                          setState(() {
                                            _genderValue = newValue;
                                          });
                                        },
                                        items: <String>['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
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
          ],
        ),
      ),
    );
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
          profileFile.add(pickedFileList);
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
            profileFile = pickedFile;
          });
        }
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    }
  }

  openFilePickerForMedicalFiles() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
    if (result != null) {
      profileFile = result.files.first;
    }
    setState(() {});
    if (profileFile != null) {
      setState(() {
        _pickImageError = false;
      });
    } else {
      setState(() {
        _pickImageError = true;
      });
    }
    print(profileFile);
  }
}

typedef void OnPickImageCallback(double maxWidth, double maxHeight, int quality);

_selectDate(BuildContext context, DateTime date) async {
  final DateTime picked = await showDatePicker(
    context: context,
    firstDate: DateTime(1900),
    initialDate: date,
    lastDate: DateTime.now(),
  );
  if (picked != null && picked != date) {
    date = picked;
    return date;
  }
}
