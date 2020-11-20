import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/ui/input_estuduff.dart';
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
            InputEstudUff(
              placeHolder: StringsEstudUff.insert_mail_placeholder,
              suffixIcon: Icon(
                FeatherIcons.mail,
                color: ColorsEstudUff.mediumGrey,
                size: Dimensions.getTextSize(18, context),
                semanticLabel: StringsEstudUff.mail_icon_semantic_label,
              ),
            ),
            InputEstudUff(
              placeHolder: StringsEstudUff.insert_password_placeholder,
              isPassword: true,
              suffixIcon: Icon(
                FeatherIcons.lock,
                color: ColorsEstudUff.mediumGrey,
                size: Dimensions.getTextSize(18, context),
                semanticLabel: StringsEstudUff.lock_icon_semantic_label,
              ),
            ),
            InputEstudUff(
              placeHolder: StringsEstudUff.insert_current_course_placeholder,
              isPassword: true,
              suffixIcon: Icon(
                FeatherIcons.bookOpen,
                color: ColorsEstudUff.mediumGrey,
                size: Dimensions.getTextSize(18, context),
                semanticLabel: StringsEstudUff.open_book_icon_semantic_label,
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
                color: ColorsEstudUff.primaryBlue,
                onPressed: () {
                  // TO-DO: implementar chamada de evento para cadastrar o usuário
                },
                child: Text(
                  StringsEstudUff.save_account_button_title.toUpperCase(),
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
