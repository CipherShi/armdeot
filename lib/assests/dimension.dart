import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class Dimensions {
  BuildContext context;
  Dimensions({this.context});

  double get w {
    return MediaQuery.of(this.context).size.width;
  }

  double get h {
    return MediaQuery.of(this.context).size.height;
  }

  double width(double value) {
    double resp = (value / 360) * w;
    return resp;
  }

  double height(double value) {
    double resp = (value / 725) * h;
    return resp;
  }

  double radius(double value) {
    double resp = (value / 360) * w;
    return resp;
  }

  double topbottom(double value) {
    double resp = (value / 725) * h;
    return resp;
  }

  double rightleft(double value) {
    double resp = (value / 360) * w;
    return resp;
  }
}
