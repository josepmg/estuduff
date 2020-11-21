import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:flutter/material.dart';

class StylesEstudUff {
  // TextStyles
  static TextStyle appbarTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorsEstudUff.lightGrey,
      fontSize: Dimensions.getTextSize(20, context),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle drawerTitleTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorsEstudUff.drawerTitleBlack,
      // fontFamily: "RobotoMono",
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.getTextSize(20, context),
    );
  }

  static TextStyle drawerSubtitleTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorsEstudUff.drawerSubtitleGray,
      // fontFamily: "RobotoMono",
      fontWeight: FontWeight.normal,
      fontSize: Dimensions.getTextSize(14, context),
    );
  }

  static TextStyle drawerItemTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorsEstudUff.drawerItemBlack,
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.getTextSize(14, context),
    );
  }

  // InputDecoration

  // BoxDecoration

  // BorderStyle

}
