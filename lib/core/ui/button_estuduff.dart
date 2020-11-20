import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ButtonEstudUff extends StatefulWidget {
  final String text;
  final Function onPressed;

  const ButtonEstudUff({Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ButtonEstudUffState();
  }
}

class _ButtonEstudUffState extends State<ButtonEstudUff> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: Dimensions.getConvertedWidthSize(280, context),
      height: Dimensions.getConvertedHeightSize(48, context),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        color: ColorsEstudUff.primaryBlue,
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(fontSize: Dimensions.getTextSize(14, context)),
        ),
        textColor: Colors.white,
      ),
    );
  }
}
