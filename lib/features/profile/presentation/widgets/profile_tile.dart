import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/features/environment/presentation/bloc/environment_bloc.dart';
import 'package:estuduff/features/environment/presentation/pages/BaseEnviromentScreen.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:estuduff/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:estuduff/features/profile/presentation/pages/SelectProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTile extends StatefulWidget {
  final String tileTitle;
  final String tileSubtitle;
  final String tileIcon;
  final Color tileMarginColor;
  final bool shouldChangeProfile;
  final StudyProfileEnum studyProfile;
  const ProfileTile({
    Key key,
    this.tileTitle,
    this.tileSubtitle,
    this.tileIcon,
    this.tileMarginColor,
    this.shouldChangeProfile,
    this.studyProfile,
  }) : super(key: key);

  @override
  _ProfileTileState createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding:
            Dimensions.getEdgeInsets(context, left: 20, right: 10, top: 10),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              style: BorderStyle.solid,
              width: Dimensions.getConvertedHeightSize(15, context),
              color: widget.tileMarginColor ?? ColorsEstudUff.black,
            ),
          ),
        ),
        // height: Dimensions.getConvertedHeightSize(194, context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title & subtitle
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.getConvertedHeightSize(
                      widget.tileTitle ==
                              StringsEstudUff.jack_of_all_trades_title
                          ? 14
                          : 40,
                      context),
                ),
                Text(
                  widget.tileTitle ?? "null",
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(30, context),
                    fontWeight: FontWeight.normal,
                    color: ColorsEstudUff.pageTitles,
                  ),
                ),
                Text(
                  widget.tileSubtitle ?? "null",
                  style: TextStyle(
                    fontSize: Dimensions.getTextSize(14, context),
                    fontWeight: FontWeight.normal,
                    color: ColorsEstudUff.mediumGrey,
                  ),
                ),
              ],
            ),

            SvgPicture.asset(
              widget.tileIcon ?? StringsEstudUff.available_env_icon,
              height: Dimensions.getConvertedHeightSize(87, context),
              width: Dimensions.getConvertedWidthSize(90, context),
            ),
          ],
        ),
      ),
      onTap:
          widget.shouldChangeProfile ? _updateStudyProfile : _showStudyPlaces,
    );
  }

  _updateStudyProfile() {
    BlocProvider.of<ProfileBloc>(context).add(
      SetProfileEvent(widget.studyProfile),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SelectProfilePage(
          shouldChangeProfile: true,
        ),
      ),
    );
  }

  _showStudyPlaces() {
    BlocProvider.of<EnvironmentBloc>(context)
        .add(GetByProfileEvent(widget.studyProfile));
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BaseEnviromentScreen(profile: widget.studyProfile),
    ));
  }
}
