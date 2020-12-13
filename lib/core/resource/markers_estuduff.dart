import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/features/environment/presentation/pages/SingleEnviromentScreen.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkersEstudUff {
  /// Get marker from Environment
  static Marker getMarker({
    @required double latitude,
    @required double longitude,
    @required StudyProfileEnum studyProfileEnum,
    @required Environment environment,
    @required BuildContext context,
  }) {
    MarkerId markerId;
    double hue;
    switch (studyProfileEnum) {
      case StudyProfileEnum.LONELY_WOLF:
        markerId = MarkerId('blue');
        hue = BitmapDescriptor.hueBlue;
        break;
      case StudyProfileEnum.OUTGOING:
        markerId = MarkerId('red');
        hue = BitmapDescriptor.hueRed;
        break;
      default:
        markerId = MarkerId('green');
        hue = BitmapDescriptor.hueGreen;
        break;
    }

    return Marker(
      markerId: markerId,
      draggable: false,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                SingleEnviromentScreen(environment: environment)));
      },
      position: LatLng(latitude, longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(hue),
    );
  }

  static final List<Marker> jackAllTradesMarkers = [
    Marker(
      markerId: MarkerId('green'),
      draggable: false,
      onTap: () {
        // TO-DO: implementar onTap
      },
      position: LatLng(-22.906382, -43.133637),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('blue'),
      draggable: false,
      onTap: () {
        // TO-DO: implementar onTap
      },
      position: LatLng(-22.906382, -43.132860),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    Marker(
      markerId: MarkerId('red'),
      draggable: false,
      onTap: () {
        // TO-DO: implementar onTap
      },
      position: LatLng(-22.906790, -43.132859),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
  ];

  static final List<Marker> outGoingMarkers = [
    Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          // TO-DO: implementar onTap
        },
        position: LatLng(-22.906382, -43.133637)),
    Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          // TO-DO: implementar onTap
        },
        position: LatLng(-22.906797, -43.132859)),
  ];

  static final List<Marker> lonelyWolfMarkers = [
    Marker(
      markerId: MarkerId('blue'),
      draggable: false,
      onTap: () {
        // TO-DO: implementar onTap
      },
      position: LatLng(-22.906382, -43.132860),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
  ];
}
