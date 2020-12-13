import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/ui/custom_drawer.dart';
import 'package:flutter/material.dart';

class AppBarEstudUff extends StatefulWidget {
  final String title;
  final Widget body;

  const AppBarEstudUff({Key key, @required this.title, @required this.body})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppBarEstudUffState();
  }
}

class _AppBarEstudUffState extends State<AppBarEstudUff> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(
              color: ColorsEstudUff.mediumGrey,
              fontWeight: FontWeight.w500,
              fontSize: Dimensions.getTextSize(20, context)),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: ColorsEstudUff.mediumGrey),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        elevation: 8.0,
      ),
      drawer: CustomDrawer(),
      body: widget.body,
    );
  }
}
