import 'dart:convert';

import 'package:estuduff/features/auth/data/model/degree_model.dart';
import 'package:estuduff/features/auth/data/model/modality_model.dart';
import 'package:estuduff/features/auth/domain/entity/program.dart';
import 'package:flutter/foundation.dart';

class ProgramModel extends Program {
  ProgramModel(
      {@required id, @required name, @required modality, @required degree})
      : super(id: id, name: name, modality: modality, degree: degree);

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ProgramModel(
      id: json['id'],
      name: json['name'],
      modality: ModalityModel.fromJson(json['modality']),
      degree: DegreeModel.fromJson(json['degree']),
    );
  }

  factory ProgramModel.fromEntity(Program program) {
    if (program == null) return null;
    return ProgramModel(
      id: program.id,
      name: program.name,
      modality: program.modality,
      degree: program.degree,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    if (modality != null)
      json['modality'] = modality is ModalityModel
          ? (modality as ModalityModel).toJson()
          : null;
    if (degree != null)
      json['degree'] =
          degree is DegreeModel ? (degree as DegreeModel).toJson() : null;
    return json;
  }
}
