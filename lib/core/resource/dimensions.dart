import 'package:flutter/material.dart';

class Dimensions {
  /// The height size of the base screen.
  /// The base screen is the screen of the cellphone using to define the designs
  static final double baseScreenHeight = 640.0;

  /// The width size of the base screen.
  /// The base screen is the screen of the tablet using to define the designs
  static final double baseScreenWidth = 360.0;

  static double getTextSize(double sizeInPixel, BuildContext context) {
    return getConvertedWidthSize(sizeInPixel, context);
  }

  static double getConvertedHeightSize(
      double sizeInPixel, BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double currentScreenHeight = queryData.size.height;
    if (sizeInPixel == null) sizeInPixel = 0.0;

    return (sizeInPixel * (currentScreenHeight)) / baseScreenHeight;
  }

  static double getConvertedWidthSize(
      double sizeInPixel, BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double currentScreenWidth = queryData.size.width;

    if (sizeInPixel == null) sizeInPixel = 0.0;

    return (sizeInPixel * (currentScreenWidth)) / baseScreenWidth;
  }

  static EdgeInsets getEdgeInsets(BuildContext context,
      {double top, double bottom, double left, double right}) {
    return EdgeInsets.only(
      top: getConvertedHeightSize(top, context),
      bottom: getConvertedHeightSize(bottom, context),
      left: getConvertedWidthSize(left, context),
      right: getConvertedWidthSize(right, context),
    );
  }

  static EdgeInsets getEdgeInsetsSymetric(BuildContext context,
      {double vertical, double horizontal}) {
    return EdgeInsets.symmetric(
      vertical: getConvertedHeightSize(vertical, context),
      horizontal: getConvertedWidthSize(horizontal, context),
    );
  }

  static EdgeInsets getEdgeInsetsAll(BuildContext context, double size) {
    return EdgeInsets.only(
        top: getConvertedHeightSize(size, context),
        bottom: getConvertedHeightSize(size, context),
        left: getConvertedWidthSize(size, context),
        right: getConvertedWidthSize(size, context));
  }

  static EdgeInsets getEdgeInsetsFromLTRB(BuildContext context, double left,
      double top, double right, double bottom) {
    return EdgeInsets.fromLTRB(
        getConvertedWidthSize(left, context),
        getConvertedHeightSize(top, context),
        getConvertedWidthSize(right, context),
        getConvertedHeightSize(bottom, context));
  }
}
