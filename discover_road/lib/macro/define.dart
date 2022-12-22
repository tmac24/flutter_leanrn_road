// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

final kWidth = window.physicalSize.width / window.devicePixelRatio;
final KWight = window.physicalSize.height / window.devicePixelRatio;

double hc_ScreenWidth() {
  return window.physicalSize.width / window.devicePixelRatio;
}

double hc_ScreenHeight() {
  return window.physicalSize.height / window.devicePixelRatio;
}

double K_FitWidth(double width) {
  return kWidth / 375.0 * width;
}

double K_FitHeigh(double height) {
  return KWight / 667.0 * height;
}
