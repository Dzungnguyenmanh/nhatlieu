
// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Size size = PlatformDispatcher.instance.views.first.physicalSize /
    PlatformDispatcher.instance.views.first.devicePixelRatio;

const num DESIGN_WITH = 375;
const num DESIGN_HEIGHT = 812;
const num DESIGN_STATUS_BAR = 44;

get width {
  return size.width;
}

get height {
  num statusbar = PlatformDispatcher.instance.views.first.viewPadding.top;
  num buttomBar =
      MediaQueryData.fromView(PlatformDispatcher.instance.views.first)
          .viewPadding
          .bottom;
  num heightscreen = size.height - statusbar - buttomBar;
  return heightscreen;
}

double getHorizonSize(double px) {
  return ((px * width) / DESIGN_WITH);
}

double getVerticalSize(double px) {
  return ((px * height) / (DESIGN_HEIGHT - DESIGN_STATUS_BAR));
}

double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizonSize(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

double getFontSize(double px) {
  return getSize(px);
}

EdgeInsetsGeometry getPadding(
    {double? all, double? left, double? top, double? right, double? bottom}) {
  return getMarginOrPadding(
      all: all, left: left, top: top, right: right, bottom: bottom);
}

EdgeInsetsGeometry getMargin(
    {double? all, double? left, double? top, double? right, double? bottom}) {
  return getMarginOrPadding(
      all: all, left: left, top: top, right: right, bottom: bottom);
}

EdgeInsetsGeometry getMarginOrPadding(
    {double? all, double? left, double? top, double? right, double? bottom}) {
  if (all != null) {
    left = left;
    top = top;
    right = right;
    bottom = bottom;
  }

  return EdgeInsets.only(
      left: getHorizonSize(left ?? 0),
      top: getVerticalSize(top ?? 0),
      right: getHorizonSize(right ?? 0),
      bottom: getVerticalSize(bottom ?? 0));
}

