import 'package:estuduff/features/environment/domain/entity/campus.dart';

class CampusModel extends Campus {
  final int id;
  final String name;

  CampusModel({this.id, this.name}) : super(id: id, name: name);

  factory CampusModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return CampusModel(
      id: json['id'],
      name: json['name'],
    );
  }

  factory CampusModel.fromEntity(Campus campus) {
    if (campus == null) return null;
    return CampusModel(
      id: campus.id,
      name: campus.name,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    return json;
  }
}
