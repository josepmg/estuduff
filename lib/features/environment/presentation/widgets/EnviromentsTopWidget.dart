import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/fonts_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta/meta.dart';

class EnviromentsTopWidget extends StatelessWidget {
  final String name;
  final String icon;

  const EnviromentsTopWidget(
      {Key key, @required this.name, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Dimensions.getConvertedWidthSize(180, context),
              child: Text(
                name,
                style: TextStyle(
                  color: ColorsEstudUff.darkGrey,
                  fontFamily: FontsEstudUff.rubik,
                  fontSize: Dimensions.getTextSize(26, context),
                ),
              ),
            ),
            Text(
              StringsEstudUff.you_are_here,
              style: TextStyle(
                color: ColorsEstudUff.mediumGrey,
                fontFamily: FontsEstudUff.open_sans,
                fontSize: Dimensions.getTextSize(14, context),
              ),
            ),
          ],
        ),
        SvgPicture.asset(
          icon,
          width: Dimensions.getConvertedWidthSize(100, context),
        ),
      ],
    );
  }
}
