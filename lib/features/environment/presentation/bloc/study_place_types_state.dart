part of 'study_place_types_bloc.dart';

abstract class StudyPlaceTypesState extends Equatable {
  const StudyPlaceTypesState();

  @override
  List<Object> get props => [];
}

class InitialStudyPlaceTypesState extends StudyPlaceTypesState {}

class LoadingStudyPlacesTypeState extends StudyPlaceTypesState {}

class LoadedStudyPlacesTypeState extends StudyPlaceTypesState {
  final List<StudyPlaceType> studyPlaceTypeList;

  LoadedStudyPlacesTypeState(this.studyPlaceTypeList);

  @override
  List<Object> get props => [studyPlaceTypeList];
}

class ErrorStudyPlacesTypeState extends StudyPlaceTypesState {
  final String message;

  ErrorStudyPlacesTypeState(this.message);

  @override
  List<Object> get props => [message];
}
