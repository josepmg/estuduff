import 'package:equatable/equatable.dart';
import 'package:estuduff/features/environment/domain/entity/campus.dart';

class Building extends Equatable {
  final int id;
  final String name;
  final Campus campus;

  Building({this.id, this.name, this.campus});

  @override
  List<Object> get props => [this.id, this.name, this.campus];
}
