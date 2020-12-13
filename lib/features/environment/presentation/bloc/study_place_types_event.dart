part of 'study_place_types_bloc.dart';

abstract class StudyPlaceTypesEvent extends Equatable {
  const StudyPlaceTypesEvent();

  @override
  List<Object> get props => [];
}

class GetAllStudyPlaceTypeTypesEvent extends StudyPlaceTypesEvent {}
