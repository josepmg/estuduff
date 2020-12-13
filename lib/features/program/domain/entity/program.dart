import 'package:equatable/equatable.dart';
import 'package:estuduff/features/program/domain/entity/degree.dart';
import 'package:estuduff/features/program/domain/entity/modality.dart';

class Program extends Equatable {
  final int id;
  final String name;
  final Modality modality;
  final Degree degree;

  Program({this.id, this.name, this.modality, this.degree});

  @override
  List<Object> get props => [id, name, modality, degree];
}
