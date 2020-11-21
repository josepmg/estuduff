import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/fonts_estuduf.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvailableEnviroments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AvailableEnviromentsState();
  }
}

class _AvailableEnviromentsState extends State<AvailableEnviroments> {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          // go back to login/register
        ],
        title: Text(
          StringsEstudUff.available_title,
          style: TextStyle(color: ColorsEstudUff.mediumGrey),
        ),
        leading: Icon(Icons.menu, color: ColorsEstudUff.mediumGrey),
        elevation: 8.0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: Dimensions.getConvertedHeightSize(15, context),
            color: ColorsEstudUff.lightGrey,
          ),
          Container(
            alignment: Alignment.center,
            padding: Dimensions.getEdgeInsetsAll(context, 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:
                                Dimensions.getConvertedWidthSize(180, context),
                            child: Text(
                              StringsEstudUff.available_title,
                              style: TextStyle(
                                color: ColorsEstudUff.darkGrey,
                                fontFamily: FontsEstudUff.rubik,
                                fontSize: Dimensions.getTextSize(26, context),
                              ),
                            ),
                          ),
                          Text(
                            StringsEstudUff.you_are_here,
                            style: TextStyle(
                              color: ColorsEstudUff.mediumGrey,
                              fontFamily: FontsEstudUff.open_sans,
                              fontSize: Dimensions.getTextSize(14, context),
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        StringsEstudUff.available_env_icon,
                        width: Dimensions.getConvertedWidthSize(100, context),
                      ),
                    ],
                  ),
                  // maps
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
