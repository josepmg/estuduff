import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/fonts_estuduff.dart';
import 'package:estuduff/core/resource/markers_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/ui/appbar_estuduff.dart';
import 'package:estuduff/core/ui/button_estuduff.dart';
import 'package:estuduff/core/ui/input_estuduff.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FilterByTypeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FilterByTypeScreenState();
  }
}

class _FilterByTypeScreenState extends State<FilterByTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarEstudUff(
          title: StringsEstudUff.select_type_title,
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: Dimensions.getEdgeInsetsAll(context, 28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                StringsEstudUff.filter_by_type_title,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: Dimensions.getTextSize(24, context),
                    fontFamily: FontsEstudUff.rubik),
              ),
              InputEstudUff(
                placeHolder: StringsEstudUff.filter_by_type_placeholder,
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(16, context),
              ),
              ButtonEstudUff(
                  width: double.infinity,
                  text: StringsEstudUff.filter_by_type_search_button
                      .toUpperCase(),
                  onPressed: () {
                    // TODO: implementar pesquisa de localidade no mapa;
                  }),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
