import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:follo_patient_app/modules/auth/login_screen.dart';
import 'package:follo_patient_app/modules/dashboard/widgets/patient_chat_screen.dart';
import 'package:follo_patient_app/shared_preference/preference.dart';
import 'package:follo_patient_app/splash/splash_screen.dart';
import 'package:follo_patient_app/sqflite_db/db_helper.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/navigator.dart';
import 'package:follo_patient_app/utils/service_locator.dart';
import 'package:follo_patient_app/utils/utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:sizer/sizer.dart';

DbConversationProvider convoProvider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  convoProvider = DbConversationProvider();
  await convoProvider.ready;

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Platform.isIOS ? Brightness.dark : Brightness.light,
    statusBarIconBrightness: Platform.isIOS ? Brightness.dark : Brightness.light,
  ));
  Preference().instance();
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("c6915733-10aa-45e5-a1d7-f3636fcfac02");

  OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
    // Display Notification, send null to not display, send notification to display
    event.complete(event.notification);
  });

  OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    // Will be called whenever a notification is opened/button pressed.
    print(result.notification.additionalData['conversation_id'].toString());
    print(result.notification.additionalData['follo_up_id'].toString());
    Map<String, dynamic> dict = HashMap();
    dict["folloUpId"] = result.notification.additionalData['follo_up_id'];
    dict["conversationId"] = result.notification.additionalData['conversation_id'].toString();

    if (!Preference.shared.getBool(Preference.shouldRouteFromNotification)) {
      dict["isFromNotification"] = true;
      NavigationUtilities.pushRoute(
        LoginScreen.route,
        args: dict,
      );
    } else {
      if (Preference.shared.getWasAppKilled()) {
        print("========== killed app navigation ===========");
        Timer(Duration(seconds: 3), () async {
          await Preference.shared.setBool(Preference.wasAppKilled, false);
          dict["isFromNotification"] = true;
          NavigationUtilities.pushRoute(
            LoginScreen.route,
            args: dict,
          );
        });
      } else {
        print("+++++++++++ not killed app navigation +++++++++++");
        NavigationUtilities.pushRoute(
          PatientChatScreen.route,
          args: dict,
        );
      }
    }
  });

  OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    // Will be called whenever the permission changes
    // (ie. user taps Allow on the permission prompt in `iOS`)
  });

  OneSignal.shared.setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    // Will be called whenever the subscription changes
    // (ie. user gets registered with OneSignal and gets a user ID)
  });

  OneSignal.shared.setEmailSubscriptionObserver((OSEmailSubscriptionStateChanges emailChanges) {
    // Will be called whenever then user's email subscription changes
    // (ie. OneSignal.setEmail(email) is called and the user gets registered
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Utils.globalContext = context;
    return GestureDetector(
      onTap: () {
        FocusScopeNode _currentFocus = FocusScope.of(context);
        if (!_currentFocus.hasPrimaryFocus && _currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationUtilities.key,
            onGenerateRoute: onGenerateRoute,
            title: 'Follo Patient',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: Theme.of(context).appBarTheme.copyWith(
                    backgroundColor: ColorUtils.primaryColor,
                    systemOverlayStyle: SystemUiOverlayStyle.light,
                  ),
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
