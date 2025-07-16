import 'package:flutter/material.dart';

class ScreenSize {
  static double height(context) => MediaQuery.of(context).size.height;

  static double width(context) => MediaQuery.of(context).size.width;
}

enum DeviceType {
  Mobile,
  Tablet,
  Desktop,
}

DeviceType getDeviceType(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 600) {
    return DeviceType.Mobile;
  } else if (screenWidth >= 600 && screenWidth < 1024) {
    return DeviceType.Tablet;
  } else {
    return DeviceType.Desktop;
  }
}
