import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:estuduff/core/platform/settings.dart';
import 'package:estuduff/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:estuduff/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:estuduff/features/auth/data/repository/auth_repository_impl.dart';
import 'package:estuduff/features/auth/domain/repository/auth_repository.dart';
import 'package:estuduff/features/auth/domain/usecase/get_token_use_case.dart';
import 'package:estuduff/features/auth/domain/usecase/sign_in_use_case.dart';
import 'package:estuduff/features/auth/domain/usecase/sign_out_use_case.dart';
import 'package:estuduff/features/auth/domain/usecase/sign_up_use_case.dart';
import 'package:estuduff/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:estuduff/features/environment/data/datasource/environment_remote_data_source.dart';
import 'package:estuduff/features/environment/data/repository/environment_repository_impl.dart';
import 'package:estuduff/features/environment/domain/repository/environment_repository.dart';
import 'package:estuduff/features/environment/domain/usecase/get_all_study_place_types_use_case.dart';
import 'package:estuduff/features/environment/domain/usecase/get_environment_use_case.dart';
import 'package:estuduff/features/environment/presentation/bloc/environment_bloc.dart';
import 'package:estuduff/features/environment/presentation/bloc/study_place_types_bloc.dart';
import 'package:estuduff/features/profile/data/datasource/study_profile_data_source.dart';
import 'package:estuduff/features/profile/data/repository/study_profile_repository_impl.dart';
import 'package:estuduff/features/profile/domain/repository/study_profile_repository.dart';
import 'package:estuduff/features/profile/domain/usecase/set_study_profile_use_case.dart';
import 'package:estuduff/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:estuduff/features/program/data/datasource/program_remote_data_source.dart';
import 'package:estuduff/features/program/data/repository/program_repository_impl.dart';
import 'package:estuduff/features/program/domain/repository/program_repository.dart';
import 'package:estuduff/features/program/domain/usecase/get_all_programs.dart';
import 'package:estuduff/features/program/presentation/bloc/program_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/platform/network_info.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Init external functionalities
  await _initExternal();

  // Init core functionalities
  _initCore();

  // Init features
  _initAuth();
  _initEnvironment();
  _initProfile();
  _initProgram();
}

_initExternal() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
}

_initCore() {
  getIt.registerLazySingleton(() => DataConnectionChecker());
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton<Settings>(() => Settings());
}

_initAuth() {
  // Data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
        networkInfo: getIt(),
        remoteDataSource: getIt(),
        localDataSource: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => SignInUseCase(getIt()));
  getIt.registerLazySingleton(() => SignUpseCase(getIt()));
  getIt.registerLazySingleton(() => SignOutUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTokenUseCase(getIt()));

  // BLoC
  getIt.registerFactory(() => AuthBloc(
        getTokenUseCase: getIt(),
        signInUseCase: getIt(),
        signOutUseCase: getIt(),
        signUpUseCase: getIt(),
      ));
}

_initEnvironment() {
  // Data sources
  getIt.registerLazySingleton<EnvironmentRemoteDataSource>(
    () => EnvironmentRemoteDataSourceImpl(),
  );

  // Repository
  getIt.registerLazySingleton<EnvironmentRepository>(
    () => EnvironmentRepositoryImpl(
      networkInfo: getIt(),
      remoteDataSource: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetEnvironmentuseCase(getIt()));
  getIt.registerLazySingleton(() => GetAllStudyPlaceTypesUseCase(getIt()));

  // BLoC
  getIt.registerFactory(() => EnvironmentBloc(getIt()));
  getIt.registerFactory(() => StudyPlaceTypesBloc(getIt()));
}

_initProfile() {
  // Data sources
  getIt.registerLazySingleton<StudyProfileRemoteDatasource>(
    () => StudyProfileRemoteDatasourceImpl(),
  );

  // Repository
  getIt.registerLazySingleton<StudyProfileRepository>(
    () => StudyProfileRepositoryImpl(
      networkInfo: getIt(),
      remoteDataSource: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => SetStudyProfileUseCase(getIt()));

  // BLoC
  getIt.registerFactory(() => ProfileBloc(getIt()));
}

_initProgram() {
  // Data sources
  getIt.registerLazySingleton<ProgramRemoteDataSource>(
    () => ProgramRemoteDataSourceImpl(),
  );

  // Repository
  getIt.registerLazySingleton<ProgramRepository>(
    () => ProgramRepositoryImpl(
      networkInfo: getIt(),
      remoteDataSource: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetAllProgramsUseCase(getIt()));

  // BLoC
  getIt.registerFactory(() => ProgramBloc(getIt()));
}

void reset() {
  getIt.reset();
  init();
}
