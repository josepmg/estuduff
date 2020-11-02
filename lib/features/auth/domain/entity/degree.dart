import 'package:equatable/equatable.dart';

class Degree extends Equatable {
  final int id;
  final String name;

  Degree({this.id, this.name});

  @override
  List<Object> get props => [id, name];
}
