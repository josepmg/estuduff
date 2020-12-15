import 'package:estuduff/core/error/exception.dart';
import 'package:estuduff/core/platform/network_info.dart';
import 'package:estuduff/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:estuduff/features/environment/data/datasource/environment_remote_data_source.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:estuduff/features/environment/domain/entity/study_place_type.dart';
import 'package:estuduff/features/environment/domain/repository/environment_repository.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:flutter/services.dart';

class EnvironmentRepositoryImpl implements EnvironmentRepository {
  final EnvironmentRemoteDataSource remoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;

  EnvironmentRepositoryImpl(
      {this.remoteDataSource, this.authLocalDataSource, this.networkInfo});

  @override
  Future<Either<Failure, List<Environment>>> getEnvironments(
      {int profileId, int typeId}) async {
    if (await networkInfo.isConnected) {
      try {
        List<Environment> list = await remoteDataSource.getEnvironments(
            profileId: profileId, typeId: typeId);
        return Right(list);
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

  @override
  Future<Either<Failure, List<StudyPlaceType>>>
      getAllStudyPlaceTypeTypes() async {
    if (await networkInfo.isConnected) {
      try {
        List<StudyPlaceType> list =
            await remoteDataSource.getAllStudyPlaceTypeTypes();
        return Right(list);
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

  @override
  Future<Either<Failure, List<Environment>>> getHomeEnvironments() async {
    if (await networkInfo.isConnected) {
      try {
        StudyProfileEnum studyProfile =
            await authLocalDataSource.getUserStudyProfile();
        if (studyProfile != null) {
          List<Environment> list = await remoteDataSource.getEnvironments(
              profileId: studyProfile.getProfileId());
          return Right(list);
        } else {
          return null;
        }
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
