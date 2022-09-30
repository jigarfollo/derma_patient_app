import 'dart:collection';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/main.dart';
import 'package:follo_patient_app/modules/dashboard/doctor_profile_screen.dart';
import 'package:follo_patient_app/modules/home/main_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/sqflite_db/models/follo_conversation.dart';
import 'package:follo_patient_app/utils/audio_player_dialog.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/custom_card.dart';
import 'package:follo_patient_app/utils/decoration_utils.dart';
import 'package:follo_patient_app/utils/error_handler.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/pdf_viewer.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/text_utils.dart';
import 'package:follo_patient_app/utils/utils.dart';
import 'package:follo_patient_app/utils/video_player_dialog.dart';
import 'package:follo_patient_app/utils/widgets/size_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

ScrollController scrollController = ScrollController();

class PatientChatScreen extends StatefulWidget {
  final int folloUpId;
  final String conversationId;
  final bool isFromNotification;
  final bool enableOptions;
  static const String route = "patientChatScreen";
  const PatientChatScreen({
    @required this.folloUpId,
    @required this.conversationId,
    this.isFromNotification = false,
    this.enableOptions = true,
  });

  @override
  State<PatientChatScreen> createState() => _PatientChatScreenState();
}

class _PatientChatScreenState extends State<PatientChatScreen> {
  List<dynamic> tempAssetFiles = [];
  bool fileImgUploadError = false;
  List<dynamic> tempFiles = [];
  bool showMediaSelection = false;
  PatientappChatMessage tempMessage;
  ResponseOptions tempOptions;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  dynamic _pickImageError;
  bool isVideo = false;
  VideoPlayerController _controller;
  DoctorInfoResponse doctorInfoResponse = DoctorInfoResponse();
  String sp = "";
  GlobalData globalData = locator<GlobalData>();
  HttpService httpService = locator<HttpService>();

  _scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  Future<bool> doctorInfoApiCall() async {
    if (sp.isNotEmpty) return true;
    http.Response response = await httpService.doctorInfoApi(
      userToken: globalData.userToken,
      userId: globalData.userId,
      folloUpId: widget.folloUpId,
      clinicId: clinicId,
    );

    print(response.toString());

    if (response.statusCode == 200) {
      DoctorInfoResponse _doctorInfoResponse = DoctorInfoResponse();
      _doctorInfoResponse.mergeFromBuffer(response.bodyBytes);
      if (_doctorInfoResponse.status == "success") {
        sp = "";
        doctorInfoResponse = _doctorInfoResponse;
        if (doctorInfoResponse != null) {
          for (CaregiverSpeciality item in doctorInfoResponse.specialities) {
            sp += "${item.name}, ";
          }
          sp = sp.substring(0, sp.length - 2);
        }
        return true;
      } else {
        if (_doctorInfoResponse.status == "auth_expired") {
          await doctorInfoApiCall();
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(_doctorInfoResponse.status).toString(),
            btnOkOnPress: () {},
          )..show();
          return false;
        }
      }
      return false;
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
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });

    return Scaffold(
      backgroundColor: ColorUtils.backgroundGreyColor,
      body: Column(
        children: [
          FutureBuilder(
              future: doctorInfoApiCall(),
              builder: (context, data) {
                return Stack(
                  children: [
                    Container(
                      height: screenHeight(context) * 0.11,
                      decoration: BoxDecoration(
                        color: ColorUtils.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(getSize(30.0)),
                          bottomRight: Radius.circular(getSize(30.0)),
                        ),
                      ),
                    ),
                    Image.asset(
                      ImageConstants.backgroundMask1,
                      height: screenHeight(context) * 0.11,
                      width: screenWidth(context),
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: getSize(26), left: getSize(6), bottom: getSize(8)),
                      alignment: Alignment.bottomCenter,
                      height: screenHeight(context) * 0.11,
                      child: InkWell(
                        onTap: () {
                          Map<String, dynamic> dict = HashMap();
                          dict["caregiverInfo"] = doctorInfoResponse;
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
                                if (widget.isFromNotification) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(MainScreen.route, (Route<dynamic> route) => false);
                                } else {
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                            Container(
                              width: 42,
                              height: 42,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: doctorInfoResponse.profilePicture.url != null && doctorInfoResponse.profilePicture.url.isNotEmpty
                                    ? CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: doctorInfoResponse.profilePicture.url,
                                        placeholder: (context, url) => CupertinoActivityIndicator(),
                                        errorWidget: (context, url, error) => new Icon(Icons.error),
                                      )
                                    : Image.asset(ImageConstants.doctor, fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(width: getSize(10)),
                            Text(
                              doctorInfoResponse.name,
                              textAlign: TextAlign.left,
                              style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                color: ColorUtils.titleTextColorWhite,
                                fontSize: getFontSize(16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 26, right: 26),
              child: StreamBuilder<DbFolloConversation>(
                stream: convoProvider.getConversationForFolloId(widget.conversationId, widget.enableOptions),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<PatientappChatMessage> messageList = [];

                    if (snapshot.data.conversations.v.isNotEmpty) {
                      List<String> tempList = snapshot.data.conversations.v.split(Utils.listSaparator);

                      for (String item in tempList) {
                        messageList.add(PatientappChatMessage.fromJson(item));
                      }
                    }
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollToBottom();
                    });
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 16),
                      controller: scrollController,
                      itemCount: messageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Column(
                            crossAxisAlignment: messageList[index].trafficType == "outgoing" ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                                ),
                                decoration: BoxDecoration(
                                  color: messageList[index].trafficType == "outgoing" ? Colors.black.withOpacity(0.5) : ColorUtils.primaryColor,
                                  borderRadius: messageList[index].trafficType == "outgoing"
                                      ? BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                          bottomRight: Radius.circular(16),
                                        )
                                      : BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                ),
                                child: messageList[index].trafficType == "outgoing"
                                    ? Padding(
                                        padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                                        child: Text(
                                          messageList[index].text,
                                          style: TextUtils.mediumPoppinsStyle.copyWith(fontSize: getFontSize(14), color: Colors.white),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 0,
                                      ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              if (messageList[index].trafficType == "outgoing")
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Wrap(
                                    spacing: 7,
                                    runSpacing: 7,
                                    children: optionList(context, messageList[index], messageList.length - 1 == index),
                                  ),
                                ),
                              SizedBox(
                                height: 8,
                              ),
                              if (messageList[index].mediaPresent)
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    height: getSize(62),
                                    // color: Colors.red,
                                    child: ListView.builder(
                                        itemCount: messageList[index].media.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (BuildContext context, int ind) {
                                          if (['image/jpg', 'image/jpeg', 'image/png', 'jpg', 'jpeg', 'png']
                                              .contains(messageList[index].media[ind].mediaType.toString().toLowerCase()))
                                            return ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
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
                                                                messageList[index].media[ind].url,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                    right: 8,
                                                  ),
                                                  width: getSize(70),
                                                  height: getSize(60),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(12),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl: messageList[index].media[ind].url,
                                                      placeholder: (context, url) => CupertinoActivityIndicator(),
                                                      errorWidget: (context, url, error) => new Icon(Icons.error),
                                                    ),
                                                    // Image.network(
                                                    //   summary[index]
                                                    //       .attachments[
                                                    //           mediaIndex]
                                                    //       .url,
                                                    //   fit: BoxFit.cover,
                                                    // ),
                                                  ),
                                                  // ),
                                                ),
                                              ),
                                            );

                                          if ([
                                            'video/mp4',
                                            'mp4',
                                          ].contains(messageList[index].media[ind].mediaType.toString().toLowerCase())) {
                                            return InkWell(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return VideoPlayerDialog(
                                                        videoUrl: messageList[index].media[ind].url.toString(),
                                                      );
                                                    });

                                                // playVideo(
                                                //     '${widget.folloUp.conversations[widget.folloIndex].summary[index].attachments[attachmentIndex].url}');
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  right: 8,
                                                ),
                                                child: SizedBox(
                                                  width: getSize(70),
                                                  height: getSize(60),
                                                  child: Card(
                                                    elevation: 4,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(4.0),
                                                      child: Image.asset(
                                                        ImageConstants.videoIcon,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          if (['audio/mp3', 'audio/ogg', 'audio/amr', 'audio/mpeg', 'mp3', 'ogg', 'amr', 'mpeg']
                                              .contains(messageList[index].media[ind].mediaType.toString().toLowerCase()))
                                          // if (widget
                                          //     .folloUp.conversations[widget.folloIndex].conversationMessages[index].media[mediaIndex].mediaType ==
                                          // "audio/mpeg")
                                          {
                                            return InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AudioPlayerDialog(
                                                      audioUrl: messageList[index].media[ind].url,
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  right: 8,
                                                ),
                                                child: SizedBox(
                                                  width: getSize(70),
                                                  height: getSize(60),
                                                  child: Card(
                                                    elevation: 4,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(9),
                                                      child: Image.asset(
                                                        ImageConstants.audioIcon,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          if ([
                                            'application/pdf',
                                            'pdf',
                                          ].contains(messageList[index].media[ind].mediaType.toString().toLowerCase())) {
                                            return InkWell(
                                              onTap: () {
                                                Map<String, dynamic> dict = HashMap();
                                                dict["pdfUrl"] = messageList[index].media[ind].url;
                                                NavigationUtilities.pushRoute(
                                                  PDFViewer.route,
                                                  args: dict,
                                                );
                                              },
                                              child: SizedBox(
                                                width: getSize(70),
                                                height: getSize(60),
                                                child: Card(
                                                  elevation: 4,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 16,
                                                    ),
                                                    child: Image.asset(
                                                      ImageConstants.pdfImage,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          return Container();
                                        }),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          AnimatedContainer(
            height: showMediaSelection ? getSize(120) : 0,
            duration: Duration(milliseconds: 200),
            child: CustomCard(
              child: Stack(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      minHeight: getSize(50),
                      maxHeight: getSize(120),
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
                          padding: EdgeInsets.only(left: getSize(8)),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: tempAssetFiles.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(top: getSize(8), right: getSize(12)),
                                child: Container(
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(6),
                                          child: Container(
                                              height: getSize(60),
                                              width: getSize(60),
                                              child: tempAssetFiles[index] is XFile
                                                  ? ['jpg', 'png', 'gif', 'jpeg'].contains((tempAssetFiles[index] as XFile)
                                                          .path
                                                          .toString()
                                                          .substring((tempAssetFiles[index] as XFile).path.toString().lastIndexOf(".") + 1))
                                                      ? Image.file(File(tempAssetFiles[index].path), fit: BoxFit.cover)
                                                      : Container()
                                                  : Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(6),
                                                          border: Border.all(
                                                            width: 1.0,
                                                            color: ColorUtils.primaryColor,
                                                          )),
                                                      child: ['jpg', 'png', 'gif', 'jpeg'].contains(tempAssetFiles[index].extension.toLowerCase())
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
                                            print(tempFiles);
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
                        (tempFiles.length + tempAssetFiles.length) < 3
                            ? InkWell(
                                onTap: () async {
                                  await buildBottomSheet(context);
                                  print(tempFiles.length);
                                },
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: ColorUtils.primaryColor),
                                  height: getSize(40),
                                  width: getSize(80),
                                  child: Center(
                                    child: Text("Browse",
                                        textAlign: TextAlign.center,
                                        style: TextUtils.semiBoldPoppinsStyle.copyWith(
                                          fontSize: getFontSize(11),
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              )
                            : Container(),

                        if ((tempFiles.length + tempAssetFiles.length) >= 1)
                          SizedBox(
                            width: getSize(16),
                          ),

                        // Send button
                        (tempFiles.length + tempAssetFiles.length) >= 1
                            ? Padding(
                                padding: EdgeInsets.only(right: getSize(8)),
                                child: InkWell(
                                  onTap: () async {
                                    await convoProvider.onMessageResponseApiCall(widget.conversationId, tempMessage, tempOptions,
                                        imageList: tempAssetFiles, context: context);
                                    WidgetsBinding.instance?.addPostFrameCallback((_) => _scrollToBottom());

                                    setState(() {
                                      showMediaSelection = false;
                                    });
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    height: getSize(40),
                                    width: getSize(46),
                                    child: Center(
                                      child: Icon(Icons.send, size: getSize(32), color: ColorUtils.primaryColor),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  // : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> optionList(
    BuildContext context,
    PatientappChatMessage message,
    bool isLast,
  ) {
    List<Widget> list = [];

    for (ResponseOptions item in message.responseOptions) {
      list.add(
        OptionWidget(
          conversationId: widget.conversationId,
          item: item,
          message: message,
          doctorInfo: doctorInfoResponse,
          isLast: isLast,
          folloId: widget.folloUpId,
          enableOptions: widget.enableOptions, // TODO:: Put the condition for disable the user interactions on screen itself
          onMediaSelected: (value, message, options) {
            setState(() {
              tempAssetFiles = [];
              fileImgUploadError = false;
              tempFiles = [];
              showMediaSelection = value;
              tempMessage = message;
              tempOptions = options;
            });
          },
        ),
      );
    }

    return list;
  }

  openFilePickerForMedicalFiles() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: false);
    if (result != null) {
      tempAssetFiles.add(result.files.first);
    }
    setState(() {});
    if (tempAssetFiles.length >= 1) {
      setState(() {
        fileImgUploadError = false;
      });
    } else {
      setState(() {
        fileImgUploadError = true;
      });
    }
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
}

typedef void OnPickImageCallback(double maxWidth, double maxHeight, int quality);

class OptionWidget extends StatefulWidget {
  const OptionWidget({
    Key key,
    @required this.conversationId,
    @required this.item,
    @required this.message,
    @required this.doctorInfo,
    @required this.isLast,
    @required this.onMediaSelected,
    this.enableOptions = true,
    this.folloId,
  }) : super(key: key);

  final String conversationId;
  final ResponseOptions item;
  final PatientappChatMessage message;
  final DoctorInfoResponse doctorInfo;
  final bool isLast;
  final bool enableOptions;
  final int folloId;
  final Function(bool, PatientappChatMessage, ResponseOptions) onMediaSelected;

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  bool isLoading = false;
  Size optionSize;
  GlobalData globalData = locator<GlobalData>();
  HttpService httpService = locator<HttpService>();

  _scrollToBottom() {
    Future.delayed(Duration(milliseconds: widget.item.responseText.toLowerCase() == "media" ? 1000 : 100), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 100),
      );
    });
  }

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

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  emergencyInfoApiCall(Position position, String responseText, {bool emergencyCall = false}) async {
    LoadingIndicator.show(context);
    http.Response response = await httpService.emergencyInfo(
      userToken: globalData.userToken,
      userId: globalData.userId,
      caregiverName: widget.doctorInfo.name,
      caregiverId: widget.doctorInfo.userId,
      responseText: responseText,
      folloupId: widget.folloId.toString(),
      latitude: position != null ? position.latitude : 0.0 ?? 0.0,
      logitude: position != null ? position.longitude : 0.0 ?? 0.0,
      address: "",
      datapresent: position != null ? true : false ?? false,
      clinicId: clinicId,
    );
    LoadingIndicator.dismiss();
    LoadingIndicator.dismiss();

    print(response.toString());

    if (response.statusCode == 200) {
      EmergencyInfoResponse _emergencyInfoReponse = EmergencyInfoResponse();
      _emergencyInfoReponse.mergeFromBuffer(response.bodyBytes);
      if (_emergencyInfoReponse.status == "success") {
        if (emergencyCall && _emergencyInfoReponse.emergencyMobileNumber != "") {
          await _makePhoneCall(_emergencyInfoReponse.emergencyMobileNumber);
        } else {
          await launchURL(_emergencyInfoReponse.bookingUrl);
        }
      } else {
        if (_emergencyInfoReponse.status == "auth_expired") {
          await emergencyInfoApiCall(position, responseText, emergencyCall: emergencyCall);
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(_emergencyInfoReponse.status),
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
    return InkWell(
      onTap: widget.enableOptions
          ? widget.isLast
              ? () async {
                  if (widget.item.responseText.toLowerCase() == "media") {
                    widget.onMediaSelected(true, widget.message, widget.item);
                  } else {
                    widget.onMediaSelected(false, null, null);

                    IncomingPatientappMessageResponse incomingPatientappMessageResponse =
                        await convoProvider.onMessageResponseApiCall(widget.conversationId, widget.message, widget.item, context: context);
                    print(incomingPatientappMessageResponse.toString());
                    Position position;

                    // Emergency contact api call
                    if (widget.item.responseText.toLowerCase() == "call") {
                      LoadingIndicator.show(context);
                      try {
                        position = await _getCurrentPosition();
                        LoadingIndicator.dismiss();
                      } catch (e) {
                        print(e.toString());
                        LoadingIndicator.dismiss();
                      }
                      await emergencyInfoApiCall(position, widget.item.responseText, emergencyCall: true);
                    } else if (widget.item.responseText.toLowerCase() == "book appointment") {
                      LoadingIndicator.show(context);
                      try {
                        position = await _getCurrentPosition();
                        LoadingIndicator.dismiss();
                      } catch (e) {
                        print(e.toString());
                        LoadingIndicator.dismiss();
                      }
                      await emergencyInfoApiCall(position, widget.item.responseText, emergencyCall: false);
                    }
                    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
                  }
                }
              : null
          : null,
      child: Opacity(
        opacity: widget.enableOptions
            ? widget.isLast
                ? 1
                : widget.item.isSelected
                    ? 1
                    : 0.4
            : 0.4,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          decoration: BoxDecoration(
              color: widget.item.isSelected ? ColorUtils.primaryColor : Colors.grey.withOpacity(0.4), borderRadius: BorderRadius.all(Radius.circular(22))),
          child: isLoading
              ? Container(
                  width: optionSize.width,
                  height: optionSize.height,
                )
              : SizeProvider(
                  update: true,
                  onSizeChange: (size) {
                    optionSize = size;
                  },
                  child: Text(
                    widget.item.responseText.capitalize(),
                    style: TextUtils.semiBoldPoppinsStyle.copyWith(
                      color: widget.item.isSelected ? Colors.white : Colors.black.withOpacity(0.8),
                      fontSize: getFontSize(16),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

enum MessageType {
  option,
  mediaSelection,
}

class ChatMessage {
  MessageType type;
  PatientappChatMessage message;

  ChatMessage({@required this.type, @required this.message});
}
