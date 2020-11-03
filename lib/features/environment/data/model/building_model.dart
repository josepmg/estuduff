import 'package:estuduff/features/environment/data/model/campus_model.dart';
import 'package:estuduff/features/environment/domain/entity/building.dart';

class BuildingModel extends Building {
  BuildingModel({id, name, campus}) : super(id: id, name: name, campus: campus);

  factory BuildingModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return BuildingModel(
      id: json['id'],
      name: json['name'],
      campus: CampusModel.fromJson(json['campus']),
    );
  }

  factory BuildingModel.fromEntity(Building building) {
    if (building == null) return null;
    return BuildingModel(
      id: building.id,
      name: building.name,
      campus: building.campus,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    if (campus != null) json['campus'] = (campus as CampusModel).toJson();
    return json;
  }
}
