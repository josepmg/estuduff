import 'package:equatable/equatable.dart';
import 'package:estuduff/features/auth/domain/model/degree.dart';
import 'package:estuduff/features/auth/domain/model/modality.dart';

class Program extends Equatable {
  final int id;
  final String name;
  final Modality modality;
  final Degree degree;

  Program({this.id, this.name, this.modality, this.degree});

  @override
  List<Object> get props => [id, name, modality, degree];
}
