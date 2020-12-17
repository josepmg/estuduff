import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/resource/styles_estuduff.dart';
import 'package:estuduff/core/ui/custom_drawer.dart';
import 'package:estuduff/features/environment/presentation/bloc/environment_bloc.dart';
import 'package:estuduff/features/environment/presentation/pages/BaseEnviromentScreen.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:estuduff/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:estuduff/features/profile/presentation/widgets/profile_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectProfilePage extends StatelessWidget {
  final bool shouldChangeProfile;
  SelectProfilePage({Key key, this.shouldChangeProfile = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 8,
        iconTheme: IconThemeData(
          color: ColorsEstudUff.mediumGrey,
        ),
        title: Text(
          StringsEstudUff.select_profile_app_bar_title,
          style: StylesEstudUff.appbarTextStyle(context),
        ),
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ErrorProfileState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                ),
              ),
            );
          } else if (state is SettedProfileState) {
            BlocProvider.of<EnvironmentBloc>(context)
                .add(GetByProfileEvent(state.studyProfileEnum));
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => BaseEnviromentScreen(
                  // profile: state.studyProfileEnum,
                  ),
            ));
          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is LoadingProfileState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ProfileTile(
                        tileMarginColor: ColorsEstudUff.primaryBlue,
                        tileTitle: StringsEstudUff.wolf_profile,
                        tileSubtitle: StringsEstudUff.lonely_wolf_subtitle,
                        tileIcon: StringsEstudUff.wolf_env_icon,
                        studyProfile: StudyProfileEnum.LONELY_WOLF,
                        shouldChangeProfile: shouldChangeProfile,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ProfileTile(
                        tileMarginColor: ColorsEstudUff.primaryGreen,
                        tileTitle: StringsEstudUff.jack_of_all_trades_title,
                        tileSubtitle:
                            StringsEstudUff.jack_of_all_trades_subtitle,
                        tileIcon: StringsEstudUff.jack_env_icon,
                        studyProfile: StudyProfileEnum.JACK_OF_ALL_TRADES,
                        shouldChangeProfile: shouldChangeProfile,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ProfileTile(
                        tileMarginColor: ColorsEstudUff.primaryRed,
                        tileTitle: StringsEstudUff.outgoing_profile,
                        tileSubtitle: StringsEstudUff.outgoing_subtitle,
                        tileIcon: StringsEstudUff.outgoing_env_icon,
                        studyProfile: StudyProfileEnum.OUTGOING,
                        shouldChangeProfile: shouldChangeProfile,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
