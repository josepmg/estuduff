import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/features/auth/presentation/widgets/LoginTabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

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
      backgroundColor: Colors.white,
      body: Container(
        // height: Dimensions.getConvertedHeightSize(330, context),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                width: Dimensions.getConvertedWidthSize(243, context),
              ),
            ),
            LoginTabBarWidget(),
          ],
        ),
      ),
    );
  }
}
