import 'package:estuduff/core/resource/dimensions.dart';
import 'package:estuduff/core/resource/fonts_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/core/ui/appbar_estuduff.dart';
import 'package:estuduff/core/ui/button_estuduff.dart';
import 'package:estuduff/core/util/converter.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';
import 'package:estuduff/features/environment/presentation/bloc/environment_bloc.dart';
import 'package:estuduff/features/environment/presentation/bloc/study_place_types_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FilterByTypeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FilterByTypeScreenState();
  }
}

class _FilterByTypeScreenState extends State<FilterByTypeScreen> {
  var _selectedType;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StudyPlaceTypesBloc>(context)
        .add(GetAllStudyPlaceTypeTypesEvent());
  }

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
                  fontFamily: FontsEstudUff.rubik,
                ),
              ),
              // Drop down with study places types
              BlocBuilder<StudyPlaceTypesBloc, StudyPlaceTypesState>(
                builder: (context, state) {
                  if (state is LoadedStudyPlacesTypeState) {
                    return DropdownButton(
                      value: _selectedType,
                      items: state.studyPlaceTypeList.map((program) {
                        return DropdownMenuItem(
                          value: program.id,
                          child: Text("${program.name}"),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedType = value;
                        });
                      },
                    );
                  } else if (state is LoadingStudyPlacesTypeState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(16, context),
              ),
              ButtonEstudUff(
                  width: double.infinity,
                  text: StringsEstudUff.filter_by_type_search_button
                      .toUpperCase(),
                  onPressed: () {
                    BlocProvider.of<EnvironmentBloc>(context)
                        .add(GetByTypeEvent(StudyPlaceType(id: _selectedType)));
                  }),
              SizedBox(
                height: Dimensions.getConvertedHeightSize(16, context),
              ),
              // Map
              BlocBuilder<EnvironmentBloc, EnvironmentState>(
                builder: (context, state) {
                  if (state is InitialEnvironmentState) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.62,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          bearing: 200.00,
                          target: LatLng(-22.9060, -43.1323),
                          zoom: 16.5,
                        ),
                      ),
                    );
                  } else if (state is LoadedEnvironmentState) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.62,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          bearing: 200.00,
                          target: LatLng(-22.9060, -43.1323),
                          zoom: 16.5,
                        ),
                        markers: Set.from(
                          Converter.getMarkersFromList(
                            state.environmentList,
                            context,
                          ),
                        ),
                      ),
                    );
                  } else if (state is LoadingEnvironmentState) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.62,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
