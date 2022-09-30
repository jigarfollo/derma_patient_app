import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static const String _isUserLoggedIn = "isUserLoggedIn";
  static const String _userToken = "userToken";
  static const String _userId = "userId";
  static const String _userType = "userType";
  static const String _playerId = "playerId";
  static const String subscribed = "subscribed";
  static const String mobileNumber = "mobileNumber";
  static const String patientCriticalAlert = "patientCriticalAlert";
  static const String patientMessageChat = "patientMessageChat";
  static const String localSessionExpired = "localSessionExpired";
  static const String isBiometric = "isBiometric";
  static const String shouldRouteFromNotification = "shouldRouteFromNotification";
  static const String wasAppKilled = "wasAppKilled";
  // ------------------ SINGLETON ----------------------- //
  static final Preference _preference = Preference._internal();

  factory Preference() {
    return _preference;
  }

  Preference._internal();

  static Preference get shared => _preference;

  static SharedPreferences _pref;

  // make connection with preference only once in application /
  Future<SharedPreferences> instance() async {
    if (_pref != null) return _pref;
    await SharedPreferences.getInstance().then((onValue) {
      _pref = onValue;
    }).catchError((onError) {
      _pref = null;
    });
    return _pref;
  }

  bool getIsUserLoggedIn() {
    return _pref.getBool(_isUserLoggedIn) ?? false;
  }

  setIsUserLoggedIn(bool value) {
    _pref.setBool(_isUserLoggedIn, value);
  }

  String getUserToken() {
    return _pref.getString(_userToken) ?? "";
  }

  setUserToken(String value) {
    _pref.setString(_userToken, value);
  }

  String getUserId() {
    return _pref.getString(_userId) ?? "";
  }

  setUserId(String value) {
    _pref.setString(_userId, value);
  }

  String getMobileNumber() {
    return _pref.getString(mobileNumber);
  }

  setMobileNumber(String value) {
    return _pref.setString(mobileNumber, value);
  }

  String getPlayerId() {
    return _pref.getString(_playerId) ?? "";
  }

  setPlayerId(String value) {
    _pref.setString(_playerId, value);
  }

  String getUserType() {
    return _pref.getString(_userType) ?? "";
  }

  setUserType(String value) {
    _pref.setString(_userType, value);
  }

  // Bool get & set
  bool getBool(String key) {
    return _pref.getBool(key) ?? false;
  }

  Future<bool> setBool(String key, bool value) {
    return _pref.setBool(key, value);
  }

  bool getWasAppKilled() {
    return _pref.getBool(wasAppKilled) ?? false;
  }

  setWasAppKilled(bool value) {
    _pref.setBool(wasAppKilled, value);
  }

  clearSharedPreference() {
    _pref.clear();
  }

  // /* remove  element from preferences */
  // Future<bool> remove(key, [multi = false]) async {
  //   SharedPreferences pref = await instance();
  //   if (multi) {
  //     key.forEach((f) async {
  //       return await pref.remove(f);
  //     });
  //   } else {
  //     return await pref.remove(key);
  //   }

  //   return new Future.value(true);
  // }

  // /* remove all elements from preferences */
  // Future<bool> clear() async {
  //   // return await _pref.clear();
  //   // Except FCM token & device info
  //   _pref.getKeys().forEach((key) async {
  //     if (key != _playerId) {
  //       await _pref.remove(key);
  //     }
  //   });
  //   return Future.value(true);
  // }
}
