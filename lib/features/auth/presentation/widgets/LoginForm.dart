import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/ui/button_estuduff.dart';
import 'package:estuduff/core/ui/input_estuduff.dart';
import 'package:estuduff/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final EMAIL_LABEL = "EMAIL_LABEL";
  final PASSWORD_LABEL = "PASSWORD_LABEL";
  final _formData = Map<String, String>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dimensions.getEdgeInsets(context, top: 15),
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
            onChanged: (String value) {
              setState(() {
                _formData[EMAIL_LABEL] = value;
              });
            },
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
            onChanged: (String value) {
              setState(() {
                _formData[PASSWORD_LABEL] = value;
              });
            },
          ),
          SizedBox(
            height: Dimensions.getConvertedHeightSize(20, context),
          ),
          ButtonEstudUff(
            text: StringsEstudUff.send_button_title.toUpperCase(),
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(SignInEvent(
                email: _formData[EMAIL_LABEL],
                password: _formData[PASSWORD_LABEL],
              ));
              // Navigator.of(context).push(
              //   CupertinoPageRoute(
              //     builder: (context) => SelectProfilePage(),
              //   ),
              // );
            },
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
