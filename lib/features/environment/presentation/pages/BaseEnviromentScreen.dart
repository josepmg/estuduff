import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/markers_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/ui/appbar_estuduff.dart';
import 'package:estuduff/core/util/profile-converter.dart';
import 'package:estuduff/features/environment/presentation/widgets/EnviromentsTopWidget.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return AppBarEstudUff(
      title: widget.title == null
          ? ProfileConverter.recoverStudyProfile(widget.profile)
          : widget.title,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: Dimensions.getConvertedHeightSize(15, context),
            decoration: BoxDecoration(
              color: ProfileConverter.recoverProfileColor(widget.profile),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: Dimensions.getEdgeInsetsAll(context, 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EnviromentsTopWidget(
                    icon: ProfileConverter.recoverProfileIcon(widget.profile),
                    name: ProfileConverter.recoverStudyProfile(widget.profile),
                  ),
                  SizedBox(
                    height: Dimensions.getConvertedHeightSize(24, context),
                  ),
                  SizedBox(
                    width: Dimensions.getConvertedWidthSize(350, context),
                    height: Dimensions.getConvertedHeightSize(385, context),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          bearing: 200.00,
                          target: LatLng(-22.9060, -43.1323),
                          zoom: 16.5),
                      markers: Set.from(MarkersEstudUff.jackAllTradesMarkers),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
