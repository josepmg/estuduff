import 'package:estuduff/features/auth/domain/entity/modality.dart';
import 'package:flutter/foundation.dart';

class ModalityModel extends Modality {
  ModalityModel({@required id, @required name}) : super(id: id, name: name);

  factory ModalityModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ModalityModel(
      id: json['id'],
      name: json['name'],
    );
  }

  factory ModalityModel.fromEntity(Modality modality) {
    if (modality == null) return null;
    return ModalityModel(
      id: modality.id,
      name: modality.name,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    return json;
  }
}
