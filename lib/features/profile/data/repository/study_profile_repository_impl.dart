import 'package:estuduff/core/error/exception.dart';
import 'package:estuduff/core/platform/network_info.dart';
import 'package:estuduff/features/profile/data/datasource/study_profile_data_source.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:estuduff/features/profile/domain/repository/study_profile_repository.dart';
import 'package:flutter/services.dart';

class StudyProfileRepositoryImpl implements StudyProfileRepository {
  final StudyProfileRemoteDatasource remoteDataSource;
  final NetworkInfo networkInfo;

  StudyProfileRepositoryImpl({this.remoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, bool>> setStudyProfile(
      StudyProfileEnum studyProfile) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.setStudyProfile(studyProfile));
      } on ServerException {
        return Left(ServerFailure());
      } on PlatformException catch (e) {
        return Left(PlatformFailure(message: e.message));
      } catch (e) {
        return Left(GenericFailure(message: e.message));
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
