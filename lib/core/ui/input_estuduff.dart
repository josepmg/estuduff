import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/fonts_estuduf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputEstudUff extends StatefulWidget {
  final String placeHolder;
  final Widget suffixIcon;
  final TextInputType keyboardType;
  final Function onChanged;
  final Function onSubmitted;
  final Function onTap;
  final bool enabled;
  final int maxLength;
  final TextEditingController controller;
  final String hintMessage;
  final String errorMessage;
  final bool isPassword;

  const InputEstudUff(
      {Key key,
      this.placeHolder,
      this.suffixIcon,
      this.keyboardType,
      this.onChanged,
      this.onSubmitted,
      this.onTap,
      this.enabled,
      this.maxLength,
      this.controller,
      this.hintMessage,
      this.errorMessage,
      this.isPassword})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InputEstudUffState();
  }
}

class _InputEstudUffState extends State<InputEstudUff> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dimensions.getEdgeInsets(context, top: 20),
      child: TextField(
        controller: widget.controller,
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        onTap: widget.onTap,
        obscureText: (widget.isPassword != null) ? widget.isPassword : false,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: ColorsEstudUff.InputPlaceHolder,
          fontFamily: FontsEstudUff.open_sans,
          fontSize: Dimensions.getTextSize(14, context),
        ),
        cursorColor: ColorsEstudUff.PrimaryBlue,
        decoration: InputDecoration(
          hintText: widget.hintMessage,
          errorText: widget.errorMessage,
          labelText: widget.placeHolder,
          suffixIcon: widget.suffixIcon,
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(4.0),
            ),
          ),
        ),
      ),
    );
  }
}
