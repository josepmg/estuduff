import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/estuduff_colors.dart';
import 'package:estuduff/core/resource/estuduff_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTile extends StatelessWidget {
  final String tileTitle;
  final String tileSubtitle;
  final String tileIcon;
  final Color tileMarginColor;
  final Function onTapFunction;
  const ProfileTile(
      {Key key,
      this.tileTitle,
      this.tileSubtitle,
      this.tileIcon,
      this.tileMarginColor,
      this.onTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding:
            Dimensions.getEdgeInsets(context, left: 20, right: 10, top: 10),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              style: BorderStyle.solid,
              width: Dimensions.getConvertedHeightSize(15, context),
              color: tileMarginColor ?? EstudUffColors.black,
            ),
          ),
        ),
        // height: Dimensions.getConvertedHeightSize(194, context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title & subtitle
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(
                      tileTitle == EstudUffStrings.jack_of_all_trades_title
                          ? 14
                          : 40,
                      context),
                ),
                Text(
                  tileTitle ?? "null",
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(30, context),
                    fontWeight: FontWeight.normal,
                    color: EstudUffColors.pageTitles,
                  ),
                ),
                Text(
                  tileSubtitle ?? "null",
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(14, context),
                    fontWeight: FontWeight.normal,
                    color: EstudUffColors.inputPlaceHolder,
                  ),
                ),
              ],
            ),
            // Image
            Image.asset(
              tileIcon ?? EstudUffStrings.icon,
              height: Dimensions.getConvertedHeightSize(87, context),
              width: Dimensions.getConvertedWidthSize(94, context),
            ),
          ],
        ),
      ),
      onTap: onTapFunction,
    );
  }
}