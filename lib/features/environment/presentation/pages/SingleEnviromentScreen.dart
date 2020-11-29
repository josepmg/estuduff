import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/fonts_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/ui/appbar_estuduff.dart';
import 'package:estuduff/core/util/profile-converter.dart';
import 'package:estuduff/features/environment/domain/entity/building.dart';
import 'package:estuduff/features/environment/domain/entity/campus.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SingleEnviromentScreen extends StatefulWidget {
  // TODO: Colocar 'final'
  Environment enviroment;

  SingleEnviromentScreen({Key key, this.enviroment}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SingleEnviromentScreenState();
  }
}

class _SingleEnviromentScreenState extends State<SingleEnviromentScreen> {
  Color enviromentColor;

  @override
  Widget build(BuildContext context) {
    // TODO: remover inicialização de enviroment
    widget.enviroment = new Environment(
      id: 01,
      name: 'Biblioteca',
      complement: 'Rua Passo da Pátria',
      studyProfile: StudyProfileEnum.LONELY_WOLF,
      type: StudyPlaceType(id: 01, name: 'Biblioteca'),
      building: Building(
        id: 01,
        campus: Campus(id: 01, name: 'PV'),
        name: 'Biblioteca',
      ),
    );

    this.enviromentColor =
        ProfileConverter.recoverProfileColor(widget.enviroment.studyProfile);
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
        alignment: Alignment.topCenter,
        padding: Dimensions.getEdgeInsetsAll(context, 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: Dimensions.getConvertedWidthSize(5, context),
                        color: enviromentColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80.0),
                      child: Image.asset(
                        StringsEstudUff.library_photo,
                        width: Dimensions.getConvertedWidthSize(100, context),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.getConvertedWidthSize(20, context),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.enviroment.type.name,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: Dimensions.getTextSize(22, context),
                            fontFamily: FontsEstudUff.rubik),
                      ),
                      Container(
                        width: Dimensions.getConvertedWidthSize(160, context),
                        height: Dimensions.getConvertedHeightSize(3, context),
                        color: enviromentColor,
                        margin: Dimensions.getEdgeInsetsSymetric(context,
                            vertical: 8),
                      ),
                      Text(
                        widget.enviroment.name,
                        style: TextStyle(
                          fontFamily: FontsEstudUff.open_sans,
                          color: ColorsEstudUff.mediumGrey,
                          fontSize: Dimensions.getTextSize(14, context),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(30, context),
              ),
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
                      info: ProfileConverter.recoverStudyProfile(
                          widget.enviroment.studyProfile),
                      label: StringsEstudUff.enviroment_study_profile),
                  SvgPicture.asset(ProfileConverter.recoverProfileIcon(
                      widget.enviroment.studyProfile)),
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
}
