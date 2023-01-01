import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/auth/login_screen.dart';
import 'package:follo_patient_app/protobuf_packets/follo.pbserver.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/utils/custom_exceptions.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/navigation_service.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:http/http.dart' as http;

String clinicId = "9900a7d4ee00472e8a813aa7c1ac00ae"; // Stagging
// String clinicId = "925b48d98c1942bca36c1a6bb6cf085a"; // Production

/// TODO: Change the clinicId before deployment

class HttpService {
  // String prodUrl = "https://prod-patient-app-platform.follocare.com"; // production url is changed
  String devUrl = "https://patient-app-platform.follocare.com";

  // ******* Chat Module Api call ********
  String chatDevUrl = "https://dev-platform.follocare.com";
  // String chatProdUrl = "https://prod-platform.follocare.com";

  String currentUrl;
  String currentChatUrl;
  NavigationService navigationService = locator<NavigationService>();
  GlobalData globalData = locator<GlobalData>();

  HttpService() {
    currentUrl = devUrl;
    currentChatUrl = chatDevUrl;
  }

  dynamic _responseChecker(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;

      case 400:
        throw BadRequestException(response.body.toString());

      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());

      case 500:
        navigationService.customAlertDialog(
            message: 'Error occured while Communication with Server with StatusCode : ${response.statusCode}', buttonText: 'Okay');
        break;

      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  verifyAuthTokenStatus() async {
    try {
      if (Preference.shared.getUserToken().length != 0) {
        var text = Preference.shared.getUserToken().split('.')[1];
        var decoded = base64.decode(text);
        var data = utf8.decode(decoded);
        print(data.runtimeType);
        print(json.decode(data)['exp'] * 1000);
        if (DateTime.fromMillisecondsSinceEpoch(int.parse((json.decode(data)['exp'] * 1000).toString())).difference(DateTime.now()).inSeconds > 0) {
          return true;
        } else {
          String url = currentUrl + '/users/refreshtoken';
          RefreshToken obj = RefreshToken();
          obj.userId = Preference.shared.getUserId();
          obj.userToken = Preference.shared.getUserToken();
          http.Response response = await http.post(Uri.parse(url), body: obj.writeToBuffer());
          RefreshTokenResponse refreshTokenResponse = RefreshTokenResponse();
          refreshTokenResponse.mergeFromBuffer(response.bodyBytes);
          developer.log(refreshTokenResponse.toString());
          if (response.statusCode == 200) {
            globalData.setUserToken(userToken: refreshTokenResponse.userToken);
            Preference.shared.setUserToken(refreshTokenResponse.userToken);
          }
        }
      }
    } on Exception catch (_) {
      await navigationService.customAlertDialog(message: 'Error occured while renewing token with platform, Please Login again', buttonText: 'Okay!');
      globalData.removeUserId();
    }
  }

  _postRequest({String url, dynamic body}) async {
    await verifyAuthTokenStatus();
    http.Response response;
    try {
      response = await http.post(Uri.parse(url), body: body, headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
        "Access-Control-Allow-Methods": "POST, OPTIONS, GET"
      });
      response = _responseChecker(response);
    } on SocketException {
      print(response.toString());
      throw FetchDataException('No Internet connection');
    } on Exception catch (_) {
      developer.log("Error == $_");
      navigationService.customAlertDialog(message: 'Something went wrong..', buttonText: 'Okay!');
      developer.log(_.toString());
    }
    return response;
  }

  _deleteRequest({String url, dynamic body}) async {
    await verifyAuthTokenStatus();
    http.Response response;
    try {
      response = await http.delete(Uri.parse(url), body: body, headers: {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
        "Access-Control-Allow-Methods": "POST, OPTIONS, GET"
      });
      response = _responseChecker(response);
    } on SocketException {
      print(response.toString());
      throw FetchDataException('No Internet connection');
    } on Exception catch (_) {
      developer.log("Error == $_");
      navigationService.customAlertDialog(message: 'Something went wrong..', buttonText: 'Okay!');
      developer.log(_.toString());
    }
    return response;
  }

  removeUserId() {
    NavigationUtilities.pushRoute(
      LoginScreen.route,
    );
  }

  sendOtp({
    @required String mobileNumber,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/authentication/sendotp';
    SendOTP obj = SendOTP();
    obj.mobileNumber = mobileNumber;
    obj.clinicId = clinicId;
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    developer.log(response.toString());
    return response;
  }

  logoutApi({
    @required String userid,
    @required String usertoken,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/logout';
    Logout obj = Logout();
    obj.userId = userid;
    obj.userToken = usertoken;
    obj.clinicId = clinicId;
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    developer.log(response.toString());
    return response;
  }

  reSendOtp({
    @required String mobileNumber,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/authentication/resendotp';
    ResendOTP obj = ResendOTP();
    obj.mobileNumber = mobileNumber;
    obj.retryType = 'text';
    obj.clinicId = clinicId;
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    developer.log(response.toString());
    return response;
  }

  verifyOtp({
    @required String mobileNumber,
    @required int otp,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/authentication/verifyotp';
    VerifyOTP obj = VerifyOTP();
    obj.mobileNumber = mobileNumber;
    obj.userOtp = otp;
    obj.clinicId = clinicId;
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    developer.log(response.toString());
    return response;
  }

  login({
    @required String mobileNumber,
    int pin,
    @required bool userBiometric,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/patient_authenticate';
    PatientAuthenticate obj = PatientAuthenticate();
    obj.mobileNumber = mobileNumber;
    obj.userPin = pin;
    obj.userBiometric = userBiometric;
    obj.clinicId = clinicId;
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  userPresent({
    @required String mobileNumber,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/patient_present';
    PatientPresent obj = PatientPresent();
    obj.mobileNumber = mobileNumber;
    obj.clinicId = clinicId;
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  setPin({
    @required String mobileNumber,
    @required int otp,
    @required int pin,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/setpin';
    SetPin obj = SetPin();
    obj.mobileNumber = mobileNumber;
    obj.userOtp = otp;
    obj.userPin = pin;
    obj.clinicId = clinicId;
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  initialSubscription({
    @required String userToken,
    @required String userId,
    @required String playerId,
    @required bool subscribed,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/initialsubscription';
    InitialSubscription obj = InitialSubscription();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.playerId = playerId;
    obj.subscribed = subscribed;
    obj.clinicId = clinicId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  currentNotificationStatus({
    @required String userToken,
    @required String userId,
    @required String playerId,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/notificationstatus';
    CurrentNotificationStatus obj = CurrentNotificationStatus();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.playerId = playerId;
    obj.clinicId = clinicId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  patientSignup({
    @required String userid,
    @required String usertoken,
    @required String firstName,
    @required String lastName,
    @required String mobileNumber,
    @required Int64 dateOfBirth,
    @required String gender,
    @required String role,
    @required Media profilePicture,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/patient_signup';
    PatientSignUp obj = PatientSignUp();
    obj.userId = userid;
    obj.userToken = usertoken;
    obj.firstName = firstName;
    obj.lastName = lastName;
    obj.mobileNumber = mobileNumber;
    obj.dateOfBirth = dateOfBirth;
    obj.gender = gender;
    obj.role = role;
    obj.profilePicture = profilePicture;
    obj.clinicId = clinicId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  editPatientProfile({
    @required String userid,
    @required String usertoken,
    @required String firstName,
    @required String lastName,
    @required Int64 dateOfBirth,
    @required String gender,
    @required String role,
    Media profilePicture,
    @required String clinicId,
    String email,
    @required String patientProfileId,
  }) async {
    String url = currentUrl + '/users/edit_profile';
    EditProfile obj = EditProfile();
    obj.userId = userid;
    obj.userToken = usertoken;
    obj.firstName = firstName;
    obj.lastName = lastName;
    obj.dateOfBirth = dateOfBirth;
    obj.gender = gender;
    obj.role = role;
    obj.profilePicture = profilePicture;
    obj.clinicId = clinicId;
    obj.patientProfileId = patientProfileId;
    developer.log(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  checkAppStatus({
    @required String userToken,
    @required String userId,
    @required bool appInBackground,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/user_in_background';
    AppStatus obj = AppStatus();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.appInBackground = appInBackground;
    obj.clinicId = clinicId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  folloUpList({@required FolloUpList folloUpListObject}) async {
    String url = currentUrl + '/folloup/follouplist';

    http.Response response = await _postRequest(url: url, body: folloUpListObject.writeToBuffer());

    return response;
  }

  doctorInfoApi({
    @required String userToken,
    @required String userId,
    @required int folloUpId,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/doctor_info';
    DoctorInfo obj = DoctorInfo();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.folloUpId = folloUpId;
    obj.clinicId = clinicId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  dashboardStatsApi({
    @required String userToken,
    @required String userId,
    @required Int64 startTimestamp,
    @required Int64 endTimestamp,
    @required String clinicId,
    @required bool filterByTimestamp,
    @required String patientProfileId,
    @required bool filterByPatientProfileId,
  }) async {
    String url = currentUrl + '/analytics/folloupstats';
    FolloUpStats obj = FolloUpStats();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.startTimestamp = startTimestamp;
    obj.endTimestamp = endTimestamp;
    obj.clinicId = clinicId;
    obj.filterByTimestamp = filterByTimestamp;
    obj.patientProfileId = patientProfileId;
    obj.filterByPatientProfileId = filterByPatientProfileId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  fetchConversationApi({
    @required String userToken,
    @required String userId,
    @required String folloUpId,
    @required String mobileNumber,
    @required String clinicId,
  }) async {
    String url = currentChatUrl + '/patientapp/fetch_conversation';
    FetchPatientappConversation obj = FetchPatientappConversation();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.mobileNumber = mobileNumber;
    obj.folloUpId = folloUpId;
    obj.clinicId = clinicId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  onMessageResponseApi({
    @required String userToken,
    @required String userId,
    @required String folloUpId,
    @required String mobileNumber,
    @required String messageId,
    String platform,
    String provider,
    @required String currentNodeId,
    @required String nextNodeId,
    @required String responseText,
    @required bool mediaPresent,
    @required List<Media> media,
  }) async {
    String url = currentChatUrl + '/patientapp/onmessage';
    IncomingPatientappMessage obj = IncomingPatientappMessage();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.folloUpId = folloUpId;
    obj.mobileNumber = mobileNumber;
    obj.messageId = messageId;
    obj.platform = platform;
    obj.provider = provider;
    obj.currentNodeId = currentNodeId;
    obj.nextNodeId = nextNodeId;
    obj.responseText = responseText;
    obj.mediaPresent = mediaPresent;
    if (media != null) {
      media.forEach((element) {
        obj.media.add(element);
      });
    }
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  panicButtonApi({
    @required String userToken,
    @required String userId,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/panic_button';
    PanicButton obj = PanicButton();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.clinicId = clinicId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  termsAndPolicy({@required String platform, @required String name}) async {
    String url = currentUrl + '/users/signup/tcandpp';
    TCandPP obj = TCandPP();
    obj.platform = platform;
    obj.name = name;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  emergencyInfo({
    @required String userId,
    @required String userToken,
    @required String caregiverName,
    @required String caregiverId,
    @required String responseText,
    @required String folloupId,
    double latitude,
    double logitude,
    String address,
    @required bool datapresent,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/emergencyinfo';
    EmergencyInfo obj = EmergencyInfo();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.caregiverName = caregiverName;
    obj.caregiverId = caregiverId;
    obj.responseText = responseText;
    obj.folloUpId = folloupId;
    obj.lattitude = latitude;
    obj.logitude = logitude;
    obj.address = address;
    obj.dataPresent = datapresent;
    obj.clinicId = clinicId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  checkConversationUpdated({
    @required String userId,
    @required String userToken,
    @required String mobileNumber,
    @required String folloUpId,
    @required int numberOfMessages,
    @required String clinicId,
  }) async {
    String url = currentChatUrl + '/patientapp/check_conversation';
    CheckPatientappConversation obj = CheckPatientappConversation();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.mobileNumber = mobileNumber;
    obj.folloUpId = folloUpId;
    obj.numberOfMessages = numberOfMessages;
    obj.clinicId = clinicId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  versioningCheck({
    @required String userId,
    @required String userToken,
    @required String versionNumber,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/versioning';
    Version obj = Version();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.versionNumber = versionNumber;
    obj.clinicId = clinicId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  fetchPatient({
    @required String userId,
    @required String userToken,
    @required String mobileNumber,
    @required String clinicId,
    @required String patientProfileId,
  }) async {
    String url = currentUrl + '/users/prefill_patient';
    FetchPatient obj = FetchPatient();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.mobileNumber = mobileNumber;
    obj.clinicId = clinicId;
    obj.patientProfileId = patientProfileId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  patientDelete({
    @required String userId,
    @required String userToken,
    @required String mobileNumber,
    @required String clinicId,
    @required int userPin,
  }) async {
    String url = currentUrl + '/users/delete_profile';
    PatientDelete obj = PatientDelete();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.mobileNumber = mobileNumber;
    obj.clinicId = clinicId;
    obj.userPin = userPin;
    print(obj.toString());
    http.Response response = await _deleteRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  fetchClinicInfo({
    @required String userId,
    @required String userToken,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/clinic_info';
    ClinicInfo obj = ClinicInfo();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.clinicId = clinicId;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  createFolloUp({
    @required String userid,
    @required String userToken,
    @required String clinicId,
    @required String careTeamId,
    @required String mobileNumber,
    @required String firstName,
    @required String lastName,
    @required int age,
    @required String gender,
    List<Media> attachments,
    @required String patientProfileId,
  }) async {
    String url = currentUrl + '/folloup/undiagnosis_follo_up';
    UndiagnosisCreateFolloUp obj = UndiagnosisCreateFolloUp();
    obj.userId = userid;
    obj.userToken = userToken;
    obj.clinicId = clinicId;
    obj.careTeamId = careTeamId;
    obj.mobileNumber = mobileNumber;
    obj.firstName = firstName;
    obj.lastName = lastName;
    obj.age = age;
    obj.patientProfileId = patientProfileId;
    obj.gender = gender.toLowerCase();
    if (attachments != null) {
      attachments.forEach((element) {
        obj.attachments.add(element);
      });
    }

    developer.log('create follo obj');
    developer.log(obj.toString());
    print(obj.toString());

    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  caregiverInfo(
      {@required String userId, @required String userToken, @required String clinicId, @required String careteamId, @required String caregiverId}) async {
    String url = currentUrl + '/users/caregiverinfo';
    CaregiverInfo obj = CaregiverInfo();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.clinicId = clinicId;
    obj.careTeamId = careteamId;
    obj.caregiverId = caregiverId;
    log(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  prefillMultiplePatient({@required String mobileNumber, @required String userid, @required String userToken}) async {
    String url = currentUrl + '/users/register_prefill_multi_patient';
    FetchMultiplePatient obj = FetchMultiplePatient();
    obj.mobileNumber = mobileNumber;
    obj.userId = userid;
    obj.userToken = userToken;
    log(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  prefillPatient({@required BuildContext context, @required String mobileNumber, String userid}) async {
    String url = currentUrl + '/users/register_prefillpatient';
    FetchPatient obj = FetchPatient();
    obj.mobileNumber = mobileNumber;
    obj.userId = userid ?? '';
    obj.userToken = '';
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  addNewPatient({
    @required String userid,
    @required String mobileNumber,
    @required String firstName,
    @required String lastName,
    @required int age,
    @required String gender,
    @required String userToken,
  }) async {
    String url = currentUrl + '/users/add_patient';
    AddPatientProfile obj = AddPatientProfile();
    obj.userId = userid;
    obj.userToken = userToken;
    obj.mobileNumber = mobileNumber;
    obj.firstName = firstName;
    obj.lastName = lastName;
    obj.age = age;
    obj.gender = gender.toLowerCase();
    log(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  editPatientProfileFollo({
    @required String userId,
    @required String userToken,
    @required String patientProfileId,
    @required String firstName,
    @required String lastName,
    @required String gender,
    @required int age,
  }) async {
    String url = currentUrl + '/users/editpatient';
    EditPatientProfile obj = EditPatientProfile();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.patientProfileId = patientProfileId;
    obj.firstName = firstName;
    obj.lastName = lastName;
    obj.gender = gender;
    obj.age = age;
    print(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }

  patientList({
    @required String userId,
    @required String userToken,
    @required String mobileNumber,
    @required String clinicId,
  }) async {
    String url = currentUrl + '/users/patientlist';
    PatientList obj = PatientList();
    obj.userId = userId;
    obj.userToken = userToken;
    obj.mobileNumber = mobileNumber;
    obj.clinicId = clinicId;
    log(obj.toString());
    http.Response response = await _postRequest(url: url, body: obj.writeToBuffer());
    return response;
  }
}
