import 'package:estuduff/core/error/failure.dart';
import 'package:estuduff/core/resource/markers_estuduff.dart';
import 'package:estuduff/core/resource/strings_estuduff.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Converter {
  static String mapFailureToMessages(Failure failure) {
    if (failure is PlatformFailure)
      return failure.message ?? "Deu ruim";
    else if (failure is ServerFailure)
      return StringsEstudUff.server_failure_message ?? "Deu ruim";
    else if (failure is NoInternetConnectionFailure)
      return StringsEstudUff.server_failure_message ?? "Deu ruim";
    else if (failure is CacheFailure) {
      return StringsEstudUff.cache_failure_message ?? "Deu ruim";
    } else
      return StringsEstudUff.generic_failure_message ?? "Deu ruim";
  }

  static Future<String> loadFromAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  static List<Marker> getMarkersFromList(
      List<Environment> list, BuildContext context) {
    List<Marker> newList = List<Marker>();
    for (Environment env in list) {
      newList.add(MarkersEstudUff.getMarker(
        latitude: env.latitude,
        longitude: env.longitude,
        studyProfileEnum: env.studyProfile,
        environment: env,
        context: context,
      ));
    }
    return newList;
  }
}
