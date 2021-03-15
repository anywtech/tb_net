import 'package:flutter/material.dart';

class GlobalPref {
  // defined size or space of windows
  double _width;
  double _height;

  double get width => _width;
  double get height => _height;

  static GlobalPref of(BuildContext context) => GlobalPref(context);

  GlobalPref(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
  }

  double pw(double p) => _width * p / 100;
  double ph(double p) => _height * p / 100;
}
