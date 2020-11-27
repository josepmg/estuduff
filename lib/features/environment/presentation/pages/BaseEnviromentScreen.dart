import 'package:estuduff/core/resource/colors_estuduff.dart';
import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/markers_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/features/environment/presentation/widgets/EnviromentsTopWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BaseEnviromentScreen extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          // TODO: open drawer
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
            decoration: BoxDecoration(
              color: ColorsEstudUff.lightGrey,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: Dimensions.getEdgeInsetsAll(context, 24),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EnviromentsTopWidget(
                    icon: StringsEstudUff.available_env_icon,
                    name: StringsEstudUff.available_title,
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
