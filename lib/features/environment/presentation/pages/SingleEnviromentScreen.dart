import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/fonts_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/ui/appbar_estuduff.dart';
import 'package:estuduff/features/environment/domain/entity/building.dart';
import 'package:estuduff/features/environment/domain/entity/campus.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';
import 'package:estuduff/features/profile/data/model/study_profile_model.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleEnviromentScreen extends StatefulWidget {
  // TODO: Colocar 'final' e remover a inicialização da var
  Environment enviroment;

  SingleEnviromentScreen({Key key, this.enviroment}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SingleEnviromentScreenState();
  }
}

class _SingleEnviromentScreenState extends State<SingleEnviromentScreen> {
  @override
  Widget build(BuildContext context) {
    widget.enviroment = new Environment(
        id: 01,
        name: 'Biblioteca',
        complement: 'Rua Passo da Pátria',
        studyProfile: StudyProfileEnum.LONELY_WOLF,
        type: StudyPlaceType(id: 01, name: 'biblioteca'),
        building: Building(
          id: 01,
          campus: Campus(id: 01, name: 'PV'),
          name: 'Biblioteca',
        ));
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
      body: Container(
        alignment: Alignment.center,
        padding: Dimensions.getEdgeInsetsAll(context, 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(),
              _textInfo(
                  info: widget.enviroment.complement,
                  label: StringsEstudUff.enviroment_adress),
              _textInfo(
                  info: widget.enviroment.building.name,
                  label: StringsEstudUff.enviroment_building),
              _textInfo(
                  info: widget.enviroment.building.campus.name,
                  label: StringsEstudUff.enviroment_number),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _textInfo(
                      info:
                          _recoverStudyProfile(widget.enviroment.studyProfile),
                      label: StringsEstudUff.enviroment_study_profile),
                  SvgPicture.asset(
                      _recoverProfileIcon(widget.enviroment.studyProfile)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textInfo({@required String label, @required String info}) {
    return Container(
      padding: Dimensions.getEdgeInsetsSymetric(context, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
              fontSize: Dimensions.getTextSize(16, context),
              fontFamily: FontsEstudUff.roboto,
            ),
          ),
          Text(
            info,
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w400,
              fontSize: Dimensions.getTextSize(14, context),
              fontFamily: FontsEstudUff.roboto,
            ),
          )
        ],
      ),
    );
  }

  String _recoverStudyProfile(StudyProfileEnum profile) {
    if (profile == StudyProfileEnum.JACK_OF_ALL_TRADES) {
      return StringsEstudUff.jack_profile;
    } else if (profile == StudyProfileEnum.LONELY_WOLF) {
      return StringsEstudUff.wolf_profile;
    } else {
      return StringsEstudUff.share_profile;
    }
  }

  String _recoverProfileIcon(StudyProfileEnum profile) {
    if (profile == StudyProfileEnum.JACK_OF_ALL_TRADES) {
      return StringsEstudUff.available_env_icon;
    } else if (profile == StudyProfileEnum.LONELY_WOLF) {
      return StringsEstudUff.wolf_env_icon;
    } else {
      return StringsEstudUff.share_env_icon;
    }
  }
}
