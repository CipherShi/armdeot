import 'package:Armdeot/assests/color.dart';
import 'package:Armdeot/assests/font.dart';
import 'package:flutter/material.dart';

class HandleMsg {
  GlobalKey<ScaffoldState> globalKey;
  HandleMsg({this.globalKey});

  void show(String message, BuildContext context) {
    final snack = SnackBar(
      width: 250,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: FontStyle.normal(true),
      ),
      duration: Duration(seconds: 2),
      backgroundColor: ColorTheme.button,
    );
    ScaffoldMessenger.maybeOf(context).showSnackBar(snack);
  }
}
