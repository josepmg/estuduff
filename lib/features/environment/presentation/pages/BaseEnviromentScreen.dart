import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/ui/appbar_estuduff.dart';
import 'package:estuduff/core/util/converter.dart';
import 'package:estuduff/core/util/profile-converter.dart';
import 'package:estuduff/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:estuduff/features/environment/presentation/bloc/environment_bloc.dart';
import 'package:estuduff/features/environment/presentation/widgets/EnviromentsTopWidget.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:developer' as logger;

// ignore: must_be_immutable
class BaseEnviromentScreen extends StatefulWidget {
  // StudyProfileEnum profile;
  final String title;
  BaseEnviromentScreen({Key key, /*this.profile,*/ this.title})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BaseEnviromentScreenState();
  }
}

class _BaseEnviromentScreenState extends State<BaseEnviromentScreen> {
  String appBarTitle;

  @override
  void initState() {
    super.initState();
    appBarTitle = "Ambientes";
    // logger.log(
    //   "profile: ${widget.profile}",
    //   name: "BaseEnviromentScreen - initState",
    // );
    // logger.log(
    //   "title: ${widget.title}",
    //   name: "BaseEnviromentScreen - initState",
    // );
    // if (widget.profile == null)
    //   BlocProvider.of<AuthBloc>(context).add(GetUserDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return AppBarEstudUff(
      title: appBarTitle,
      // widget.title == null
      //     ? ProfileConverter.recoverStudyProfile(widget.profile)
      //     : widget.title,
      body:
          // BlocListener<AuthBloc, AuthState>(
          //   listener: (context, state) {
          //     if (state is AuthUserLoaded) {
          //       if (widget.profile == null) {
          //         logger.log(
          //           "state: $state",
          //           name:
          //               "BaseEnviromentScreen - BlocListener<AuthBloc, AuthState>",
          //         );
          //         logger.log(
          //           "state.user.studyProfile: ${state.user.studyProfile}",
          //           name:
          //               "BaseEnviromentScreen - BlocListener<AuthBloc, AuthState>",
          //         );
          //         widget.profile = state.user.studyProfile;
          //       }
          //     }
          //   },
          //   child:
          BlocBuilder<EnvironmentBloc, EnvironmentState>(
        builder: (context, state) {
          logger.log(
            "state: $state",
            name:
                "BaseEnviromentScreen - BlocBuilder<EnvironmentBloc, EnvironmentState>",
          );
          if (state is InitialEnvironmentState ||
              state is LoadingEnvironmentState) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
              ),
            );
          } else if (state is LoadedEnvironmentState) {
            logger.log(
              "widget.profile: ${state.studyProfile}",
              name:
                  "BaseEnviromentScreen - BlocBuilder<EnvironmentBloc, EnvironmentState>",
            );
            logger.log(
              "widget.title: ${widget.title}",
              name:
                  "BaseEnviromentScreen - BlocBuilder<EnvironmentBloc, EnvironmentState>",
            );
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: Dimensions.getConvertedHeightSize(15, context),
                  decoration: BoxDecoration(
                    color: ProfileConverter.recoverProfileColor(
                        state.studyProfile),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: Dimensions.getEdgeInsetsAll(context, 24),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        EnviromentsTopWidget(
                          icon: ProfileConverter.recoverProfileIcon(
                              state.studyProfile),
                          name: ProfileConverter.recoverStudyProfile(
                              state.studyProfile),
                        ),
                        SizedBox(
                          height:
                              Dimensions.getConvertedHeightSize(16, context),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                                bearing: 200.00,
                                target: LatLng(-22.9060, -43.1323),
                                zoom: 16.5),
                            markers: Set.from(
                              Converter.getMarkersFromList(
                                state.environmentList,
                                context,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
      // ),
    );
  }
}
