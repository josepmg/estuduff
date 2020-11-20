import 'package:estuduff/core/error/exception.dart';
import 'package:estuduff/core/platform/network_info.dart';
import 'package:estuduff/features/environment/data/datasource/environment_remote_data_source.dart';
import 'package:estuduff/features/environment/domain/entity/environment.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:estuduff/features/environment/domain/repository/environment_repository.dart';
import 'package:flutter/services.dart';

class EnvironmentRepositoryImpl implements EnvironmentRepository {
  final EnvironmentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  EnvironmentRepositoryImpl({this.remoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, List<Environment>>> getEnvironments(
      {int profileId, int typeId}) async {
    if (await networkInfo.isConnected) {
      try {
        List<Environment> list = await remoteDataSource.getEnvironments(
            profileId: profileId, typeId: typeId);
        return Right(list);
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
