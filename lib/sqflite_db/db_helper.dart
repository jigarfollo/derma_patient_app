import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:follo_patient_app/main.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pb.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/sqflite_db/models/follo_conversation.dart';
import 'package:follo_patient_app/utils/error_handler.dart';
import 'package:follo_patient_app/utils/gcloud_util.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/loading_indicator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

import 'models/db_record.dart';
import 'package:http/http.dart' as http;

DbFolloConversation snapshotToConversation(Map<String, Object> snapshot) {
  return DbFolloConversation()..fromMap(snapshot);
}

class DbConversations extends ListBase<DbFolloConversation> {
  final List<Map<String, Object>> list;
  List<DbFolloConversation> _cacheConversations;

  DbConversations(this.list) {
    _cacheConversations = List.generate(list.length, (index) => null);
  }

  @override
  DbFolloConversation operator [](int index) {
    return _cacheConversations[index] ??= snapshotToConversation(list[index]);
  }

  @override
  int get length => list.length;

  @override
  void operator []=(int index, DbFolloConversation value) => throw 'read-only';

  @override
  set length(int newLength) => throw 'read-only';
}

class DbConversationProvider {
  GcloudUtil gcloudUtil = locator<GcloudUtil>();

  final lock = Lock(reentrant: true);
  final _updateTriggerController = StreamController<bool>.broadcast();
  Database db;

  DbConversationProvider();

  Future openPath(String path) async {
    db = await openDatabase(path, version: kVersion1, onCreate: (db, version) async {
      await _createDb(db);
    }, onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < kVersion1) {
        await _createDb(db);
      }
    });
  }

  void _triggerUpdate() {
    _updateTriggerController.sink.add(true);
  }

  Future<Database> get ready async => db ??= await lock.synchronized(() async {
        if (db == null) {
          await open();
        }
        return db;
      });

  Future<DbFolloConversation> getConversation(String folloId) async {
    var list = (await db.query(tableConversations,
        columns: [columnId, columnFolloId, columnConversations, columnUpdatedDate], where: '$columnFolloId = ?', whereArgs: <Object>[folloId]));
    if (list.isNotEmpty) {
      return DbFolloConversation()..fromMap(list.first);
    }
    return null;
  }

  Future _createDb(Database db) async {
    await db.execute('DROP TABLE If EXISTS $tableConversations');
    await db.execute(
        'CREATE TABLE $tableConversations($columnId INTEGER PRIMARY KEY, $columnFolloId TEXT, $columnConversations TEXT, $columnUpdatedDate INTEGER)');
    await db.execute('CREATE INDEX ConversationsUpdated ON $tableConversations ($columnUpdatedDate)');
    _triggerUpdate();
  }

  Future open() async {
    await openPath(await fixPath(dbName));
  }

  Future<String> fixPath(String path) async => path;

  /// Add or update a conversation
  Future _saveConversation(DatabaseExecutor db, DbFolloConversation updatedConversation) async {
    if (updatedConversation.id.v != null) {
      await db.update(tableConversations, updatedConversation.toMap(), where: '$columnId = ?', whereArgs: <Object>[updatedConversation.id.v]);
    } else {
      updatedConversation.id.v = await db.insert(tableConversations, updatedConversation.toMap());
    }
  }

  Future saveConversation(DbFolloConversation updatedConversation) async {
    await _saveConversation(db, updatedConversation);
    _triggerUpdate();
  }

  Future<void> deleteConversation(int id) async {
    await db.delete(tableConversations, where: '$columnId = ?', whereArgs: <Object>[id]);
    _triggerUpdate();
  }

  var conversationsTransformer =
      StreamTransformer<List<Map<String, Object>>, List<DbFolloConversation>>.fromHandlers(handleData: (snapshotList, sink) {
    sink.add(DbConversations(snapshotList));
  });

  var conversationTransformer = StreamTransformer<Map<String, Object>, DbFolloConversation>.fromHandlers(handleData: (snapshot, sink) {
    sink.add(snapshotToConversation(snapshot));
  });

  /// Listen for changes on any conversation
  Stream<List<DbFolloConversation>> onConversations() {
    StreamController<DbConversations> ctlr;
    StreamSubscription _triggerSubscription;

    Future<void> sendUpdate() async {
      var conversations = await getListConversations();
      if (!ctlr.isClosed) {
        ctlr.add(conversations);
      }
    }

    ctlr = StreamController<DbConversations>(onListen: () {
      sendUpdate();

      /// Listen for trigger
      _triggerSubscription = _updateTriggerController.stream.listen((_) {
        sendUpdate();
      });
    }, onCancel: () {
      _triggerSubscription.cancel();
    });
    return ctlr.stream;
  }

  Future<DbFolloConversation> fetchMessageApiCall(String conversationId) async {
    GlobalData globalData = locator<GlobalData>();
    HttpService httpService = locator<HttpService>();

    print("Mobile number: " + Preference.shared.getMobileNumber().toString());
    http.Response response = await httpService.fetchConversationApi(
      userToken: globalData.userToken,
      userId: globalData.userId,
      folloUpId: conversationId,
      mobileNumber: "+91" + Preference.shared.getMobileNumber().toString(),
      clinicId: clinicId,
    );

    print(response.toString());

    if (response.statusCode == 200) {
      FetchPatientappConversationResponse fetchPatientappMessageResponse = FetchPatientappConversationResponse();
      fetchPatientappMessageResponse.mergeFromBuffer(response.bodyBytes);
      print("Fetch Patient App message response: " + "${fetchPatientappMessageResponse.status.toString()}");
      if (fetchPatientappMessageResponse.status == "success") {
        String convos = "";
        for (int i = 0; i < fetchPatientappMessageResponse.conversationMessages.length; i++) {
          if (i == fetchPatientappMessageResponse.conversationMessages.length - 1) {
            convos += "${fetchPatientappMessageResponse.conversationMessages[i].writeToJson()}";
          } else {
            convos += "${fetchPatientappMessageResponse.conversationMessages[i].writeToJson()} ${Utils.listSaparator}";
          }
        }

        return DbFolloConversation()
          ..folloId.v = conversationId
          ..conversations.v = convos
          ..updatedDate.v = DateTime.now().millisecondsSinceEpoch;
      } else {
        print(fetchPatientappMessageResponse.conversationMessages.toString());

        if (fetchPatientappMessageResponse.status == "auth_expired") {
          await fetchMessageApiCall(conversationId);
        } else {
          AwesomeDialog(
            context: Utils.globalContext,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(fetchPatientappMessageResponse.status).toString(),
            btnOkOnPress: () {},
          )..show();
        }
        return null;
      }
    } else {
      AwesomeDialog(
        context: Utils.globalContext,
        dialogType: DialogType.ERROR,
        animType: AnimType.TOPSLIDE,
        dismissOnTouchOutside: false,
        headerAnimationLoop: false,
        title: 'ERROR',
        desc: "Something went wrong!",
        btnOkOnPress: () {},
      )..show();
      return null;
    }
  }

  Future<bool> checkConversationUpdatedApiCall(String conversationId, int numberOfMessages) async {
    GlobalData globalData = locator<GlobalData>();
    HttpService httpService = locator<HttpService>();

    print("Mobile number: " + Preference.shared.getMobileNumber().toString());
    http.Response response = await httpService.checkConversationUpdated(
      userToken: globalData.userToken,
      userId: globalData.userId,
      folloUpId: conversationId,
      mobileNumber: "+91" + Preference.shared.getMobileNumber().toString(),
      numberOfMessages: numberOfMessages,
      clinicId: clinicId,
    );

    print(response.toString());

    if (response.statusCode == 200) {
      CheckPatientappConversationResponse checkPatientappConversationResponse = CheckPatientappConversationResponse();
      checkPatientappConversationResponse.mergeFromBuffer(response.bodyBytes);
      print("Fetch Patient App message response: " + "${checkPatientappConversationResponse.status.toString()}");
      if (checkPatientappConversationResponse.status == "success") {
        if (checkPatientappConversationResponse.changed) {
          DbFolloConversation currentConvo = await convoProvider.getConversation(conversationId);
          List<String> messages = currentConvo.conversations.v.split(Utils.listSaparator);

          for (var i = 0; i < checkPatientappConversationResponse.conversationMessages.length; i++) {
            messages.add(checkPatientappConversationResponse.conversationMessages[i].writeToJson());
          }
          String convos = "";
          for (int i = 0; i < messages.length; i++) {
            if (i == messages.length - 1) {
              convos += "${messages[i]}";
            } else {
              convos += "${messages[i]} ${Utils.listSaparator}";
            }
          }
          currentConvo..conversations.v = convos;
          convoProvider.saveConversation(currentConvo);
        }
        return true;
      } else {
        print(checkPatientappConversationResponse.conversationMessages.toString());
        if (checkPatientappConversationResponse.status == "auth_expired") {
          await fetchMessageApiCall(conversationId);
        } else {
          AwesomeDialog(
            context: Utils.globalContext,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(checkPatientappConversationResponse.status).toString(),
            btnOkOnPress: () {},
          )..show();
        }
        return false;
      }
    } else {
      AwesomeDialog(
        context: Utils.globalContext,
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

  Future<List<Media>> uploadImages(List<dynamic> tempAssetFiles, BuildContext context) async {
    if (tempAssetFiles != null) {
      List<Media> uploadedFiles = [];
      GlobalData globalData = locator<GlobalData>();

      print("Uploading Attachment Files");
      for (int i = 0; i < tempAssetFiles.length; i++) {
        if (tempAssetFiles[i] is PlatformFile) {
          LoadingIndicator.show(context);
          var response = await _uploadImage(
              name: globalData.userId + DateTime.now().millisecondsSinceEpoch.toString() + '.' + tempAssetFiles[i].extension,
              imageBytes: File((tempAssetFiles[i] as PlatformFile).path).readAsBytesSync(),
              context: context);
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
              context: context);
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
        print("Attachment Files Uploaded Successfully");
      }
      return uploadedFiles;
    }
    return null;
  }

  Future<IncomingPatientappMessageResponse> onMessageResponseApiCall(
      String conversationId, PatientappChatMessage message, ResponseOptions selectedResponse,
      {List<dynamic> imageList = null, BuildContext context}) async {
    GlobalData globalData = locator<GlobalData>();
    HttpService httpService = locator<HttpService>();
    List<Media> mediaList = [];
    if (imageList != null) {
      mediaList = await uploadImages(imageList, context);
    }
    LoadingIndicator.show(context);
    http.Response response = await httpService.onMessageResponseApi(
      userToken: globalData.userToken,
      userId: globalData.userId,
      folloUpId: conversationId,
      mobileNumber: "+91" + Preference.shared.getMobileNumber().toString(),
      messageId: message.messageId,
      platform: message.platform,
      provider: message.provider,
      currentNodeId: message.currentNodeId,
      nextNodeId: selectedResponse.nextNode,
      responseText: selectedResponse.responseText,
      mediaPresent: mediaList.isNotEmpty ?? false,
      media: mediaList.isNotEmpty ? mediaList : [],
    );
    LoadingIndicator.dismiss();

    print(response.toString());

    if (response.statusCode == 200) {
      IncomingPatientappMessageResponse incomingPatientappMessageResponse = IncomingPatientappMessageResponse();
      incomingPatientappMessageResponse.mergeFromBuffer(response.bodyBytes);
      print("Fetch Patient App message response: " + "${incomingPatientappMessageResponse.status.toString()}");
      if (incomingPatientappMessageResponse.status == "success") {
        print(incomingPatientappMessageResponse.nextMessageId.toString());

        DbFolloConversation currentConvo = await convoProvider.getConversation(conversationId);
        List<String> messages = currentConvo.conversations.v.split(Utils.listSaparator);
        PatientappChatMessage lastMessage = PatientappChatMessage.fromJson(messages.last);
        lastMessage.responseOptions[lastMessage.responseOptions.indexWhere((element) => element.responseText == selectedResponse.responseText)]
            .isSelected = true;
        if (mediaList.isNotEmpty) {
          lastMessage.mediaPresent = true;
          lastMessage.media.clear();
          lastMessage.media.addAll(mediaList);
        }
        messages.removeLast();
        messages.add(lastMessage.writeToJson());
        messages.add(incomingPatientappMessageResponse.nextChatMessage.writeToJson());

        String convos = "";
        for (int i = 0; i < messages.length; i++) {
          if (i == messages.length - 1) {
            convos += "${messages[i]}";
          } else {
            convos += "${messages[i]} ${Utils.listSaparator}";
          }
        }

        currentConvo..conversations.v = convos;
        convoProvider.saveConversation(currentConvo);
      } else {
        print(incomingPatientappMessageResponse.nextMessageId.toString());

        if (incomingPatientappMessageResponse.status == "auth_expired") {
          await onMessageResponseApiCall(conversationId, message, selectedResponse);
        } else {
          AwesomeDialog(
            context: Utils.globalContext,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            dismissOnTouchOutside: false,
            headerAnimationLoop: false,
            title: 'ERROR',
            desc: ErrorHandler().getErrorMessage(incomingPatientappMessageResponse.status).toString(),
            btnOkOnPress: () {},
          )..show();
        }
      }
      return incomingPatientappMessageResponse;
    } else {
      AwesomeDialog(
        context: Utils.globalContext,
        dialogType: DialogType.ERROR,
        animType: AnimType.TOPSLIDE,
        dismissOnTouchOutside: false,
        headerAnimationLoop: false,
        title: 'ERROR',
        desc: "Something went wrong!",
        btnOkOnPress: () {},
      )..show();
      return null;
    }
  }

  _uploadImage({String name, dynamic imageBytes, BuildContext context}) async {
    HttpService httpService = locator<HttpService>();

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

  /// Listed for changes on a given conversation
  Stream<DbFolloConversation> getConversationForFolloId(String folloId, bool enableOptions) {
    StreamController<DbFolloConversation> ctlr;
    StreamSubscription _triggerSubscription;
    bool apiCallDone = false;
    Future<void> sendUpdate() async {
      DbFolloConversation conversation = await getConversation(folloId);

      if (conversation == null) {
        conversation = await fetchMessageApiCall(folloId);
        await convoProvider.saveConversation(conversation);
      } else {
        if (!enableOptions && apiCallDone == false) {
          apiCallDone = await checkConversationUpdatedApiCall(folloId, conversation.conversations.value.split(Utils.listSaparator).length);
          print(apiCallDone.toString());
        } else {
          print("nothing to check");
        }
      }
      if (!ctlr.isClosed) {
        ctlr.add(conversation);
      }
    }

    ctlr = StreamController<DbFolloConversation>(onListen: () {
      sendUpdate();

      /// Listen for trigger
      _triggerSubscription = _updateTriggerController.stream.listen((_) {
        sendUpdate();
      });
    }, onCancel: () {
      _triggerSubscription.cancel();
    });
    return ctlr.stream;
  }

  /// Don't read all fields
  Future<DbConversations> getListConversations({int offset, int limit, bool descending}) async {
    // devPrint('fetching $offset $limit');
    var list = (await db.query(tableConversations,
        columns: [columnId, columnFolloId, columnConversations],
        orderBy: '$columnUpdatedDate ${(descending ?? false) ? 'ASC' : 'DESC'}',
        limit: limit,
        offset: offset));
    return DbConversations(list);
  }

  Future clearAllConversations() async {
    await db.delete(tableConversations);
    _triggerUpdate();
  }

  Future close() async {
    await db.close();
  }

  Future deleteDb() async {
    await deleteDatabase(await fixPath(dbName));
  }
}
