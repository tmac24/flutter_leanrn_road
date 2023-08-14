// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/cupertino.dart';

final kWidth = window.physicalSize.width / window.devicePixelRatio;
final KHeight = window.physicalSize.height / window.devicePixelRatio;

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
  return KHeight / 667.0 * height;
}

double navBarHeight = MediaQueryData.fromWindow(window).padding.top;

///  * [kMinInteractiveDimensionCupertino]
///  * The Material spec on touch targets at <https://material.io/design/usability/accessibility.html#layout-typography>.
const double kMinInteractiveDimension = 48.0;

/// The height of the toolbar component of the [AppBar].
const double kToolbarHeight = 56.0;

/// The height of the bottom navigation bar.
const double kBottomNavigationBarHeight = 56.0;
