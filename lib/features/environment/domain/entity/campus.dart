import 'package:equatable/equatable.dart';

class Campus extends Equatable {
  final int id;
  final String name;

  Campus({this.id, this.name});

  @override
  List<Object> get props => [id, name];
}
