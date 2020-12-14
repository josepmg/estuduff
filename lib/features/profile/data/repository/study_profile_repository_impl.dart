import 'package:estuduff/core/error/exception.dart';
import 'package:estuduff/core/platform/network_info.dart';
import 'package:estuduff/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:estuduff/features/profile/data/datasource/study_profile_data_source.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:estuduff/features/profile/domain/repository/study_profile_repository.dart';
import 'package:flutter/services.dart';

class StudyProfileRepositoryImpl implements StudyProfileRepository {
  final StudyProfileRemoteDatasource remoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;

  StudyProfileRepositoryImpl({
    this.remoteDataSource,
    this.authLocalDataSource,
    this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> setStudyProfile(
      StudyProfileEnum studyProfile) async {
    if (await networkInfo.isConnected) {
      try {
        bool success = await remoteDataSource.setStudyProfile(studyProfile);

        if (success) authLocalDataSource.cacheUserStudyProfile(studyProfile);

        return Right(success);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.statusCode, e.message));
      } on PlatformException catch (e) {
        return Left(PlatformFailure(message: e.message));
      } catch (e) {
        return Left(GenericFailure());
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }
}
