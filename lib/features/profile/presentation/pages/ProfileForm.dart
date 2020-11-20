import 'package:estuduff/core/resource/strings_estuduff.dart';
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
        actions: [
          // open drawer
        ],
        title: Text(StringsEstudUff.profile_form_title),
        leading: Icon(FeatherIcons.arrowLeft),
        elevation: 4.0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text(''),
            Text(''),
            // DropBox
            Text(''),
            // DropBox
            Text(''),
            // DropBox
            //Button
          ],
        ),
      ),
    );
  }
}
