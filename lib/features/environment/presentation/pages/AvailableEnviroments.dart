import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/fonts_estuduf.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AvailableEnviroments extends StatefulWidget {
  final List<Marker> jackAllTradesMarkers = [];
  @override
  State<StatefulWidget> createState() {
    return _AvailableEnviromentsState();
  }
}

class _AvailableEnviromentsState extends State<AvailableEnviroments> {
  @override
  Widget build(BuildContext context) {
    widget.jackAllTradesMarkers.add(
      Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          debugPrint('marker tapped');
        },
        position: LatLng(-22.906382, -43.133637),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ),
    );
    widget.jackAllTradesMarkers.add(
      Marker(
        markerId: MarkerId('myMarker'),
        draggable: false,
        onTap: () {
          debugPrint('marker tapped');
        },
        position: LatLng(-22.906382, -43.132860),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );
    widget.jackAllTradesMarkers.add(
      Marker(
          markerId: MarkerId('myMarker'),
          draggable: false,
          onTap: () {
            debugPrint('marker tapped');
          },
          position: LatLng(-22.906790, -43.132859)),
    );
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          // go back to login/register
        ],
        title: Text(
          StringsEstudUff.available_title,
          style: TextStyle(color: ColorsEstudUff.mediumGrey),
        ),
        leading: Icon(Icons.menu, color: ColorsEstudUff.mediumGrey),
        elevation: 8.0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: Dimensions.getConvertedHeightSize(15, context),
            color: ColorsEstudUff.lightGrey,
          ),
          Container(
            alignment: Alignment.center,
            padding: Dimensions.getEdgeInsetsAll(context, 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:
                                Dimensions.getConvertedWidthSize(180, context),
                            child: Text(
                              StringsEstudUff.available_title,
                              style: TextStyle(
                                color: ColorsEstudUff.darkGrey,
                                fontFamily: FontsEstudUff.rubik,
                                fontSize: Dimensions.getTextSize(26, context),
                              ),
                            ),
                          ),
                          Text(
                            StringsEstudUff.you_are_here,
                            style: TextStyle(
                              color: ColorsEstudUff.mediumGrey,
                              fontFamily: FontsEstudUff.open_sans,
                              fontSize: Dimensions.getTextSize(14, context),
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        StringsEstudUff.available_env_icon,
                        width: Dimensions.getConvertedWidthSize(100, context),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.getConvertedHeightSize(16, context),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.62,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          bearing: 200.00,
                          target: LatLng(-22.9060, -43.1323),
                          zoom: 16.5),
                      markers: Set.from(widget.jackAllTradesMarkers),
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
