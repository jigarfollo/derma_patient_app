import 'package:flutter/material.dart';
import 'package:follo_patient_app/modules/auth/login_screen.dart';
import 'package:follo_patient_app/modules/auth/patient_signup_screen.dart';
import 'package:follo_patient_app/modules/auth/reset_pin_screen.dart';
import 'package:follo_patient_app/modules/auth/signup_screen.dart';
import 'package:follo_patient_app/modules/auth/verify_otp_screen.dart';
import 'package:follo_patient_app/modules/dashboard/dashboard_screen.dart';
import 'package:follo_patient_app/modules/dashboard/doctor_profile_screen.dart';
import 'package:follo_patient_app/modules/dashboard/hospital_profile_screen.dart';
import 'package:follo_patient_app/modules/dashboard/widgets/follo_up_list_screen.dart';
import 'package:follo_patient_app/modules/dashboard/widgets/patient_chat_screen.dart';
import 'package:follo_patient_app/modules/home/main_screen.dart';
import 'package:follo_patient_app/modules/profile/widgets/delete_account_screen.dart';
import 'package:follo_patient_app/splash/splash_screen.dart';
import 'package:follo_patient_app/utils/fade_route.dart';
import 'package:follo_patient_app/utils/pdf_viewer.dart';

/// The [RouteType] determines what [PageRoute] is used for the new route.
///
/// This determines the transition animation for the new route.
enum RouteType {
  defaultRoute,
  fade,
  slideIn,
}

/// A convenience class to wrap [Navigator] functionality.
///
/// Since a [GlobalKey] is used for the [Navigator], the [BuildContext] is not
/// necessary when changing the current route.
class NavigationUtilities {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  /// A convenience method to push a new [MaterialPageRoute] to the [Navigator].
  static void push(Widget widget, {String name}) {
    key.currentState.push(MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: name),
    ));
  }

  /// A convenience method to push a new [route] to the [Navigator].
  static void pushRoute(String route, {RouteType type = RouteType.fade, Map args}) {
    if (args == null) {
      args = Map<String, dynamic>();
    }
    args["routeType"] = type;
    key.currentState.pushNamed(route, arguments: args);
  }

  /// A convenience method to push a named replacement route.
  static void pushReplacementNamed(String route, {RouteType type = RouteType.fade, Map args}) {
    if (args == null) {
      args = Map<String, dynamic>();
    }
    args["routeType"] = type;

    key.currentState.pushReplacementNamed(
      route,
      arguments: args,
    );
  }

  /// Returns a [RoutePredicate] similar to [ModalRoute.withName] except it
  /// compares a list of route names.
  ///
  /// Can be used in combination with [Navigator.pushNamedAndRemoveUntil] to
  /// pop until a route has one of the name in [names].
  static RoutePredicate namePredicate(List<String> names) {
    return (route) => !route.willHandlePopInternally && route is ModalRoute && (names.contains(route.settings.name));
  }
}

/// [onGenerateRoute] is called whenever a new named route is being pushed to
/// the app.
///
/// The [RouteSettings.arguments] that can be passed along the named route
/// needs to be a `Map<String, dynamic>` and can be used to pass along
/// arguments for the screen.
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final routeName = settings.name;
  final arguments = settings.arguments as Map<String, dynamic> ?? {};
  final routeType = arguments["routeType"] as RouteType ?? RouteType.defaultRoute;

  Widget screen;

  switch (routeName) {
    case SplashScreen.route:
      screen = SplashScreen();
      break;
    case LoginScreen.route:
      screen = LoginScreen(
        isFromNotification: arguments["isFromNotification"] ?? false,
        folloUpId: arguments["folloUpId"],
        conversationId: arguments["conversationId"],
      );
      break;
    case SignUpScreen.route:
      screen = SignUpScreen();
      break;
    case ResetPINScreen.route:
      screen = ResetPINScreen(
        mobileNumber: arguments["mobileNumber"],
        otp: arguments["otp"],
      );
      break;
    case MainScreen.route:
      screen = MainScreen(
        isFromLogin: arguments["isFromLogin"],
      );
      break;
    case DashboardScreen.route:
      screen = DashboardScreen();
      break;
    // case FolloStatusDoctorList.route:
    //   screen = FolloStatusDoctorList(
    //     pastFollowUps: false,
    //     currentlyWorkInProgress: false,
    //     upcomingFolloUps: true,
    //   );
    //   break;
    case PatientChatScreen.route:
      screen = PatientChatScreen(
        folloUpId: arguments["folloUpId"],
        conversationId: arguments["conversationId"],
        isFromNotification: arguments["isFromNotification"] ?? false,
        enableOptions: arguments["enableOptions"] ?? true,
      );
      break;
    case PatientSignupScreen.route:
      screen = PatientSignupScreen(
        mobileNumber: arguments["mobileNumber"],
        isForEdit: arguments["isForEdit"],
        patient: arguments["patient"],
      );
      break;
    case VerifyOTPScreen.route:
      screen = VerifyOTPScreen(
        mobileNumber: arguments["mobileNumber"],
      );
      break;
    case PDFViewer.route:
      screen = PDFViewer(
        pdfUrl: arguments["pdfUrl"],
      );
      break;
    case DeleteAccountScreen.route:
      screen = DeleteAccountScreen(
        mobileNumber: arguments["mobileNumber"],
      );
      break;
    case DoctorProfileScreen.route:
      screen = DoctorProfileScreen(
        caregiverInfo: arguments["caregiverInfo"],
      );
      break;
    case HospitalProfileScreen.route:
      screen = HospitalProfileScreen();
      break;
    case FolloUpListScreen.route:
      screen = FolloUpListScreen(
        upcomingFolloUps: arguments['upcomingFolloUps'],
        currentlyWorkInProgress: arguments['currentlyWorkInProgress'],
        pastFollowUps: arguments['pastFollowUps'],
        caregiverInfo: arguments['caregiverInfo'],
      );
      break;
  }

  switch (routeType) {
    case RouteType.fade:
      return FadeRoute(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName),
      );
    case RouteType.defaultRoute:
    default:
      return MaterialPageRoute(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName),
      );
  }
}
