import 'package:estuduff/features/auth/domain/entity/degree.dart';
import 'package:flutter/foundation.dart';

class DegreeModel extends Degree {
  DegreeModel({@required id, @required name}) : super(id: id, name: name);

  factory DegreeModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return DegreeModel(
      id: json['id'],
      name: json['name'],
    );
  }

  factory DegreeModel.fromEntity(Degree degree) {
    if (degree == null) return null;
    return DegreeModel(
      id: degree.id,
      name: degree.name,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    return json;
  }
}
