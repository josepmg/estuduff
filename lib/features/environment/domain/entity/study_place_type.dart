import 'package:equatable/equatable.dart';

class StudyPlaceType extends Equatable {
  final int id;
  final String name;

  StudyPlaceType({this.id, this.name});

  @override
  List<Object> get props => [id, name];
}
