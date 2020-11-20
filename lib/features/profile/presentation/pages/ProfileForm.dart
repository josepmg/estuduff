import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
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
          style: TextStyle(color: ColorsEstudUff.inputPlaceHolder),
        ),
        leading:
            Icon(Icons.chevron_left, color: ColorsEstudUff.inputPlaceHolder),
        elevation: 8.0,
      ),
      body: Container(
        alignment: Alignment.center,
        width: Dimensions.getConvertedWidthSize(280, context),
        child: Column(
          children: [
            Text(StringsEstudUff.profile_form_instruction),
            Text(StringsEstudUff.profile_form_question_one),
            // DropBox
            Text(StringsEstudUff.profile_form_question_two),
            // DropBox
            Text(StringsEstudUff.profile_form_question_three),
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
