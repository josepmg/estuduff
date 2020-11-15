import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/estuduff_strings.dart';
import 'package:estuduff/core/resource/estuduff_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class LoginTabBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginTabBarWidgetState();
  }
}

class _LoginTabBarWidgetState extends State<LoginTabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: Dimensions.getConvertedWidthSize(280, context),
            child: TabBar(
                labelColor: Colors.black,
                labelPadding: Dimensions.getEdgeInsetsAll(context, 0),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                indicator: MaterialIndicator(
                  height: 5,
                  color: Colors.blue,
                  bottomLeftRadius: 0,
                  bottomRightRadius: 0,
                  topLeftRadius: 0,
                  topRightRadius: 0,
                  tabPosition: TabPosition.bottom,
                ),
                tabs: [
                  Tab(
                      child: Text(
                    EstudUffStrings.login_title,
                    style: TextStyle(
                        fontFamily: EstudUffFonts.rubik,
                        fontWeight: FontWeight.w500,
                        fontSize: Dimensions.getTextSize(22, context)),
                  )),
                  Tab(
                    child: Text(
                      EstudUffStrings.register_title,
                      style: TextStyle(
                          fontFamily: EstudUffFonts.rubik,
                          fontWeight: FontWeight.w500,
                          fontSize: Dimensions.getTextSize(22, context)),
                    ),
                  ),
                ]),
          ),
          Container(
            color: Colors.pink,
            margin: Dimensions.getEdgeInsets(context, left: 30),
            width: Dimensions.getConvertedWidthSize(280, context),
            height: Dimensions.getConvertedHeightSize(300, context),
            child: TabBarView(children: [
              Container(
                child: Text("Home Body"),
              ),
              Container(
                child: Text("Articles Body"),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
