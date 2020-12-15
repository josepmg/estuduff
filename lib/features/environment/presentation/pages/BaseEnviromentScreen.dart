import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/ui/appbar_estuduff.dart';
import 'package:estuduff/core/util/converter.dart';
import 'package:estuduff/core/util/profile-converter.dart';
import 'package:estuduff/features/environment/presentation/bloc/environment_bloc.dart';
import 'package:estuduff/features/environment/presentation/widgets/EnviromentsTopWidget.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BaseEnviromentScreen extends StatefulWidget {
  final StudyProfileEnum profile;
  final String title;
  const BaseEnviromentScreen({Key key, @required this.profile, this.title})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _BaseEnviromentScreenState();
  }
}

class _BaseEnviromentScreenState extends State<BaseEnviromentScreen> {
  @override
  void initState() {
    super.initState();
    // if (widget.profile == null)
    //   BlocProvider.of<EnvironmentBloc>(context).add(GetAllEvent());
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return AppBarEstudUff(
      title: widget.title == null
          ? ProfileConverter.recoverStudyProfile(widget.profile)
          : widget.title,
      body: BlocListener<EnvironmentBloc, EnvironmentState>(
        listener: (context, state) {
          if (state is ErrorEnvironmentState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                ),
              ),
            );
          }
        },
        child: BlocBuilder<EnvironmentBloc, EnvironmentState>(
          builder: (context, state) {
            if (state is InitialEnvironmentState ||
                state is LoadingEnvironmentState) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                ),
              );
            } else if (state is LoadedEnvironmentState) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: Dimensions.getConvertedHeightSize(15, context),
                    decoration: BoxDecoration(
                      color:
                          ProfileConverter.recoverProfileColor(widget.profile),
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
                                widget.profile),
                            name: ProfileConverter.recoverStudyProfile(
                                widget.profile),
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
      ),
    );
  }
}
