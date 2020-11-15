import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/estuduff_colors.dart';
import 'package:estuduff/core/resource/estuduff_strings.dart';
import 'package:estuduff/core/ui/estuduff_input.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: Dimensions.getEdgeInsets(context, top: 15, left: 10),
        child: Column(
          children: [
            EstudUffInput(
              placeHolder: EstudUffStrings.insert_mail_placeholder,
              suffixIcon: Icon(
                FeatherIcons.mail,
                color: EstudUffColors.InputPlaceHolder,
                size: Dimensions.getTextSize(18, context),
                semanticLabel: EstudUffStrings.mail_icon_semantic_label,
              ),
            ),
            EstudUffInput(
              placeHolder: EstudUffStrings.insert_password_placeholder,
              isPassword: true,
              suffixIcon: Icon(
                FeatherIcons.lock,
                color: EstudUffColors.InputPlaceHolder,
                size: Dimensions.getTextSize(18, context),
                semanticLabel: EstudUffStrings.lock_icon_semantic_label,
              ),
            ),
            EstudUffInput(
              placeHolder: EstudUffStrings.insert_current_course_placeholder,
              isPassword: true,
              suffixIcon: Icon(
                FeatherIcons.bookOpen,
                color: EstudUffColors.InputPlaceHolder,
                size: Dimensions.getTextSize(18, context),
                semanticLabel: EstudUffStrings.open_book_icon_semantic_label,
              ),
            ),
            SizedBox(
              height: Dimensions.getConvertedHeightSize(20, context),
            ),
            ButtonTheme(
              minWidth: Dimensions.getConvertedWidthSize(280, context),
              height: Dimensions.getConvertedHeightSize(48, context),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                color: EstudUffColors.PrimaryBlue,
                onPressed: () {
                  // TO-DO: implementar chamada de evento para cadastrar o usuário
                },
                child: Text(
                  EstudUffStrings.save_account_button_title.toUpperCase(),
                  style:
                      TextStyle(fontSize: Dimensions.getTextSize(14, context)),
                ),
                textColor: Colors.white,
              ),
            )
          ],
        ));
  }
}
