import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:flutter/material.dart';

class AppBarEstudUff extends StatelessWidget {
  final String title;

  const AppBarEstudUff({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        // TODO: open drawer
      ],
      title: Text(
        title,
        style: TextStyle(
            color: ColorsEstudUff.mediumGrey,
            fontWeight: FontWeight.w500,
            fontSize: Dimensions.getTextSize(20, context)),
      ),
      leading: Icon(Icons.menu, color: ColorsEstudUff.mediumGrey),
      elevation: 8.0,
    );
  }
}
