import 'package:Armdeot/assests/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UIOverlay {
  static void get mainOverlay {
    return SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorTheme.statusbar.withOpacity(0),
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }
}
