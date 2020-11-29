import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkersEstudUff {
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
