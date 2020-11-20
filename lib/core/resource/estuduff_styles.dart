import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/estuduff_colors.dart';
import 'package:flutter/cupertino.dart';

class EstudUffStyles {
  // TextStyles
  static TextStyle drawerTitleTextStyle(BuildContext context) {
    return TextStyle(
      color: EstudUffColors.drawerTitleBlack,
      // fontFamily: "RobotoMono",
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.getTextSize(20, context),
    );
  }

  static TextStyle drawerSubtitleTextStyle(BuildContext context) {
    return TextStyle(
      color: EstudUffColors.drawerSubtitleGray,
      // fontFamily: "RobotoMono",
      fontWeight: FontWeight.normal,
      fontSize: Dimensions.getTextSize(14, context),
    );
  }

  static TextStyle drawerItemTextStyle(BuildContext context) {
    return TextStyle(
      color: EstudUffColors.drawerItemBlack,
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.getTextSize(14, context),
    );
  }
  // InputDecoration

  // BoxDecoration

  // BorderStyle

}
