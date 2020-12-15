import 'package:estuduff/core/error/exception.dart';
import 'package:estuduff/core/platform/network_info.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:estuduff/features/program/data/datasource/program_remote_data_source.dart';
import 'package:estuduff/features/program/domain/entity/program.dart';
import 'package:estuduff/features/program/domain/repository/program_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ProgramRepositoryImpl implements ProgramRepository {
  final ProgramRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProgramRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, List<Program>>> getAll() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getAll());
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
