import 'package:estuduff/core/resource/dimensions.dart';
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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
                labelColor: Colors.black,
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
                    'Login',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        fontSize: Dimensions.getTextSize(22, context)),
                  )),
                  Tab(
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          fontSize: Dimensions.getTextSize(22, context)),
                    ),
                  ),
                ]),
          ),
          Container(
            height: Dimensions.getConvertedHeightSize(256, context),
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
