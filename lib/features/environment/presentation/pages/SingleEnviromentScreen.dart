import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/ui/appbar_estuduff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleEnviromentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SingleEnviromentScreenState();
  }
}

class _SingleEnviromentScreenState extends State<SingleEnviromentScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarEstudUff(
          title: StringsEstudUff.enviroment_title,
        ),
      ),
      body: Column(
        children: [
          Row(),
          _textInfo(info: 'endereço', label: StringsEstudUff.enviroment_adress),
          _textInfo(info: 'prédio', label: StringsEstudUff.enviroment_building),
          _textInfo(info: 'numero', label: StringsEstudUff.enviroment_number),
          _textInfo(
              info: 'perfil', label: StringsEstudUff.enviroment_study_profile),
          SvgPicture.asset(StringsEstudUff.available_env_icon),
        ],
      ),
    );
  }

  Widget _textInfo({@required String label, @required String info}) {
    return Container(
      child: Column(
        children: [Text(label), Text(info)],
      ),
    );
  }
}
