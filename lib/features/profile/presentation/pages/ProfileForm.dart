import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/fonts_estuduf.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/ui/button_estuduff.dart';
import 'package:estuduff/core/ui/input_estuduff.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileFormState();
  }
}

class _ProfileFormState extends State<ProfileForm> {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          // open drawer
        ],
        title: Text(
          StringsEstudUff.profile_form_title,
          style: TextStyle(color: ColorsEstudUff.mediumGrey),
        ),
        leading: Icon(Icons.chevron_left, color: ColorsEstudUff.mediumGrey),
        elevation: 8.0,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: Dimensions.getEdgeInsetsAll(context, 28),
        child: Column(
          children: [
            Container(
                margin: Dimensions.getEdgeInsets(context, bottom: 28),
                child: Text(
                  StringsEstudUff.profile_form_instruction,
                  style: TextStyle(
                    color: ColorsEstudUff.mediumGrey,
                    fontFamily: FontsEstudUff.open_sans,
                    fontSize: Dimensions.getTextSize(14, context),
                  ),
                )),
            Container(
                margin: Dimensions.getEdgeInsets(context, bottom: 28),
                child: Text(StringsEstudUff.profile_form_question_one,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: FontsEstudUff.open_sans,
                      fontSize: Dimensions.getTextSize(14, context),
                    ))),
            // DropBox
            Container(
                margin: Dimensions.getEdgeInsets(context, bottom: 28),
                child: Text(StringsEstudUff.profile_form_question_two,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: FontsEstudUff.open_sans,
                      fontSize: Dimensions.getTextSize(14, context),
                    ))),
            // DropBox
            Container(
                margin: Dimensions.getEdgeInsets(context, bottom: 28),
                child: Text(StringsEstudUff.profile_form_question_three,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: FontsEstudUff.open_sans,
                      fontSize: Dimensions.getTextSize(14, context),
                    ))),
            // DropBox
            ButtonEstudUff(
              text: StringsEstudUff.send_button_title,
              onPressed: () {
                // TO-DO: Criar redirecionamento para perfil correto
              },
            ),
          ],
        ),
      ),
    );
  }
}
