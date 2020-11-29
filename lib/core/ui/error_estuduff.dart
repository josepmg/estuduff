import 'package:auto_size_text/auto_size_text.dart';
import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/fonts_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorWidgetEstudUff extends StatelessWidget {
  final String message;
  final EdgeInsetsGeometry margin;
  final double width;
  final double height;

  const ErrorWidgetEstudUff(
      {Key key, this.message, this.margin, this.width, this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      width: this.width,
      padding: Dimensions.getEdgeInsetsSymetric(context,
          horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red[500],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          SvgPicture.asset(
            StringsEstudUff.error_icon,
            color: Colors.red[500],
            width: Dimensions.getConvertedWidthSize(40, context),
          ),
          SizedBox(
            width: Dimensions.getConvertedWidthSize(16, context),
          ),
          Container(
            width: Dimensions.getConvertedWidthSize(197, context),
            child: AutoSizeText(
              this.message,
              maxLines: 3,
              style: TextStyle(
                fontFamily: FontsEstudUff.open_sans,
                fontSize: Dimensions.getTextSize(14, context),
                color: Colors.red[500],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
