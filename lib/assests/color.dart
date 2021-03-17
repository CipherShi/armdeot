import 'package:flutter/material.dart';

class ColorTheme {
  static Color get background {
    return Colors.grey[100];
  }

  static Color get navbar {
    return Colors.grey[200];
  }

  static Color get statusbar {
    return Colors.grey[200];
  }

  static Color get primary {
    return Colors.red;
  }

  static Color get white {
    return Colors.white;
  }

  static Color get amber {
    return Colors.amber;
  }

  static Color get containerShadow {
    return Colors.grey[200];
  }

  static Color get container {
    return Colors.grey[50];
  }

  static Color get button {
    return Colors.blueGrey[800];
  }

  static Color get fontLight {
    return Color(0xFFFFFFFF);
  }

  static Color get fontDark {
    return Color.fromRGBO(0, 0, 0, 0.54);
  }

  static Color dark(int opacity) {
    if (opacity == 64) {
      return Color.fromRGBO(0, 0, 0, 0.64);
    } else if (opacity == 44) {
      return Color.fromRGBO(0, 0, 0, 0.44);
    } else if (opacity == 34) {
      return Color.fromRGBO(0, 0, 0, 0.34);
    } else if (opacity == 24) {
      return Color.fromRGBO(0, 0, 0, 0.24);
    } else {
      return Color.fromRGBO(0, 0, 0, 0.54);
    }
  }
}
