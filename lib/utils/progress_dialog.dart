// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class XsProgressHud extends PopupRoute {
  /*
  * Show message.
  * */
  static Future<void> showMessage(BuildContext context, String message) async {
    try {
      if (_currentHud != null) {
        _currentHud.navigator.pop();
      }
      XsProgressHud hud = XsProgressHud();
      hud.message = message;
      _currentHud = hud;
      Navigator.push(context, hud);
      Future.delayed(hud.delayed).then((val) {
        _currentHud.navigator.pop();
        _currentHud = null;
      });
    } catch (e) {
      _currentHud = null;
    }
  }

  /*
  * show an hud.
  * when you want to do anything, you can call this show.
  * for example： begin network request
  * */
  static Future<void> show(BuildContext context) async {
    try {
      if (_currentHud != null) {
        _currentHud.navigator.pop();
      }
      XsProgressHud hud = XsProgressHud();
      // _currentHud = hud;
      // Navigator.push(context, hud);
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        _currentHud = hud;
        Navigator.push(context, hud);
      });
    } catch (e) {
      print("Progress = $e");
      _currentHud = null;
    }
  }

  /*
  * hide hud
  * when you complete something,you can call this hide to hide hud.
  * */
  static Future<void> hide() async {
    try {
      // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _currentHud.navigator.pop();
      _currentHud = null;
      // });
    } catch (e) {
      print("Progress = $e");
      _currentHud = null;
    }
  }

// hud show this message, default null. when you set ,it will show message hud, not progress hud.
  String message;
  Color progressColor = Colors.grey;
  Color progressBackgroundColor = Colors.white;
  Color coverColor = Color.fromRGBO(0, 0, 0, 0.4);
  Duration delayed = Duration(milliseconds: 2000);
  TextStyle loadingTextStyle = TextStyle(fontSize: 13.0, color: Colors.black87, fontWeight: FontWeight.normal, decoration: TextDecoration.none);
  TextStyle messageTextStyle = TextStyle(fontSize: 14.0, color: Colors.black87, fontWeight: FontWeight.w500, decoration: TextDecoration.none);

  String loadingMessage = 'loading ...';

  static XsProgressHud _currentHud;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  Duration get transitionDuration => kThemeAnimationDuration;

  @override
  bool get barrierDismissible => true;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // return Container(
    //   color: Color.fromRGBO(0, 0, 0, 0.4),
    //   child: Center(
    //     child: _getProgress(),
    //   ),
    // );
    return Material(
        color: Colors.transparent,
        child: Container(
          child: Container(
//              height: 100.0,
//              width: 100.0,
//              color: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Center(
                child: _getProgress(),
              ),
              /*child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Center(
                  child: _getProgress(),
                ),
              ),*/
            ),
          ),
        ));
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return super.buildTransitions(context, animation, secondaryAnimation, child);
  }

  Widget _getProgress() {
    if (message == null) {
      return Container(
          width: 100.0,
          height: 100.0,
          decoration: new BoxDecoration(
              // color: Colors.white,
              borderRadius: new BorderRadius.all(new Radius.circular(10))),
          child: Stack(
            children: <Widget>[
              Center(
                child: CircularProgressIndicator(
//                  backgroundColor: Colors.blueAccent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                ),
                /*child: CupertinoActivityIndicator(
                  animating: true,
                  radius: 12.0,
                ),*/
              ),
              // Center(
              //   child: Container(
              //     margin: EdgeInsets.only(top: 70.0),
              //     child: Text(loadingMessage, style: loadingTextStyle),
              //   ),
              // )
            ],
          ));
    } else {
      return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: new BoxDecoration(color: Colors.white, borderRadius: new BorderRadius.all(new Radius.circular(10))),
        child: Text(
          message,
          style: messageTextStyle,
        ),
      );
    }
  }
}
