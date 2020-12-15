import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:estuduff/features/auth/presentation/widgets/LoginTabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: Dimensions.getEdgeInsets(context, left: 30, top: 10),
            child: SvgPicture.asset(
              StringsEstudUff.logo,
              width: Dimensions.getConvertedWidthSize(280, context),
            ),
          ),
          LoginTabBarWidget(),
        ],
      ),
    );
  }
}
