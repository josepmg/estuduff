import 'package:estuduff/core/error/exception.dart';
import 'package:estuduff/core/platform/network_info.dart';
import 'package:estuduff/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:estuduff/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:estuduff/features/auth/data/model/user_model.dart';
import 'package:estuduff/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:estuduff/features/auth/domain/entity/user.dart';
import 'package:estuduff/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {@required this.localDataSource,
      @required this.remoteDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, User>> signUp({
    String name,
    String email,
    String password,
    int programId,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel studentModel = await remoteDataSource.signUp(
          name: name,
          email: email,
          password: password,
          programId: programId,
        );
        if (studentModel != null && studentModel.id != null)
          await localDataSource.cacheUserToken(studentModel.id);
        return Right(studentModel);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.statusCode, e.message));
      } on PlatformException catch (e) {
        return Left(PlatformFailure(message: e.message));
      } catch (e) {
        return Left(GenericFailure(message: e.message));
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel studentModel = await remoteDataSource.signIn(email, password);

        if (studentModel != null && studentModel.id != null)
          await localDataSource.cacheUserToken(studentModel.id);

        if (studentModel != null && studentModel.studyProfile != null)
          await localDataSource
              .cacheUserStudyProfile(studentModel.studyProfile);

        return Right(studentModel);
      } on ServerException catch (e) {
        return Left(
            ServerFailure(e?.statusCode ?? 400, e?.message ?? "Deu ruim"));
      } on PlatformException catch (e) {
        return Left(PlatformFailure(message: e?.message ?? "Deu ruim"));
      } catch (e) {
        return Left(GenericFailure(message: e?.message ?? "Deu ruim"));
      }
    } else {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      return Right(await localDataSource.cleanCache());
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      print("[AuthRemoteDataSourceImpl] ${e.toString()}");
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, int>> getToken() async {
    try {
      return Right(await localDataSource.getToken());
    } on CacheException {
      return Left(CacheFailure());
    } on PlatformException catch (e) {
      return Left(PlatformFailure(message: e.message));
    } catch (e) {
      return Left(GenericFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, User>> getUserData() async {
    if (await networkInfo.isConnected) {
      try {
        int userId = await localDataSource.getToken();
        if (userId != null) {
          UserModel studentModel = await remoteDataSource.getUserData(userId);

          if (studentModel != null && studentModel.id != null)
            await localDataSource.cacheUserToken(studentModel.id);

          if (studentModel != null && studentModel.studyProfile != null)
            await localDataSource
                .cacheUserStudyProfile(studentModel.studyProfile);

          return Right(studentModel);
        } else {
          return Left(CacheFailure());
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(e.statusCode, e.message));
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
