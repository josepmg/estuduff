import 'package:equatable/equatable.dart';

class Modality extends Equatable {
  final int id;
  final String name;

  Modality({this.id, this.name});

  @override
  List<Object> get props => [id, name];
}
