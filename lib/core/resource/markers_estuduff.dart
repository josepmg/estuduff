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
              SingleEnviromentScreen(environment: environment),
        ));
      },
      position: LatLng(latitude, longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(hue),
    );
  }
}
