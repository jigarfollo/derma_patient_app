import 'dart:developer' as developer;

import 'package:flutter/services.dart';
import 'package:gcloud/storage.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:mime/mime.dart';

class GcloudUtil {
  auth.ServiceAccountCredentials _credentials;
  auth.AutoRefreshingAuthClient _client;
  Storage storage;

  GcloudUtil() {
    getCredentials();
    connect();
  }

  getCredentials() async {
    // String data = await rootBundle.loadString('lib/utils/media_service_account.json');
    try {
      // String data = new File('lib/utils/media_service_account.json').readAsStringSync();
      String data = await rootBundle.loadString('lib/utils/media_service_account.json');
      _credentials = auth.ServiceAccountCredentials.fromJson(data);
      developer.log(data);
    } catch (e) {
      print("=xxxxxxxxxxxxxxxxxx Failed to fetch credentials xxxxxxxxxxxxxxxxxxxxxxx=");
      print(e.toString());
      print("=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=");
      return;
    }
  }

  connect() async {
    try {
      await getCredentials();
      // var credentials = auth.ServiceAccountCredentials.fromJson(_credentials);
      var scopes = Storage.SCOPES;
      _client = await auth.clientViaServiceAccount(_credentials, scopes);

      storage = Storage(_client, 'follo-00');
    } catch (e) {
      print("=xxxxxxxxxxxxxx Failed to connect server xxxxxxxxxxxxxx=");
      print(e.toString());
      print("=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=");
      return;
    }
  }

  Future<ObjectInfo> uploadFile(String name, dynamic imgBytes) async {
    if (_client == null) {
      await connect();
    }
    try {
      var bucket = storage.bucket('media.follocare.com');
      final fileType = lookupMimeType(name);
      return await bucket.writeBytes(
        name,
        imgBytes,
        metadata: ObjectMetadata(contentType: fileType),
      );
    } catch (e) {
      print("=xxxxxxxxxxxxxx Failed to connect server xxxxxxxxxxxxxx=");
      print(e.toString());
      print("=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=");
      return null;
    }
  }
}
