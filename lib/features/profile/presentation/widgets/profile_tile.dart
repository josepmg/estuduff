import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
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
              color: tileMarginColor ?? ColorsEstudUff.black,
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
                      tileTitle == StringsEstudUff.jack_of_all_trades_title
                          ? 14
                          : 40,
                      context),
                ),
                Text(
                  tileTitle ?? "null",
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(30, context),
                    fontWeight: FontWeight.normal,
                    color: ColorsEstudUff.pageTitles,
                  ),
                ),
                Text(
                  tileSubtitle ?? "null",
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(14, context),
                    fontWeight: FontWeight.normal,
                    color: ColorsEstudUff.mediumGrey,
                  ),
                ),
              ],
            ),

            SvgPicture.asset(
              tileIcon ?? StringsEstudUff.available_env_icon,
              height: Dimensions.getConvertedHeightSize(87, context),
              width: Dimensions.getConvertedWidthSize(90, context),
            ),
          ],
        ),
      ),
      onTap: onTapFunction,
    );
  }
}
