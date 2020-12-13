import 'dart:async';
import 'dart:developer' as logger;

import 'package:estuduff/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:estuduff/features/auth/presentation/pages/LoginPage.dart';
import 'package:estuduff/features/environment/presentation/bloc/environment_bloc.dart';
import 'package:estuduff/features/environment/presentation/bloc/study_place_types_bloc.dart';
import 'package:estuduff/features/environment/presentation/pages/FilterByTypeScreen.dart';
import 'package:estuduff/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:estuduff/features/profile/presentation/pages/ProfileForm.dart';
import 'package:estuduff/features/profile/presentation/pages/select_profile_page.dart';
import 'package:estuduff/features/program/presentation/bloc/program_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init app dependencies
  await di.init();

  FlutterError.onError = (FlutterErrorDetails details) {
    logger.log("Exception: ${details.exception.toString()}",
        name: "Flutter error");
    logger.log("Stack: ${details.stack}", name: "Flutter error");
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  runZonedGuarded<Future<void>>(() async {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (_) => di.getIt<AuthBloc>(),
          ),
          BlocProvider<EnvironmentBloc>(
            create: (_) => di.getIt<EnvironmentBloc>(),
          ),
          BlocProvider<ProfileBloc>(
            create: (_) => di.getIt<ProfileBloc>(),
          ),
          BlocProvider<ProgramBloc>(
            create: (_) => di.getIt<ProgramBloc>(),
          ),
          BlocProvider<StudyPlaceTypesBloc>(
            create: (_) => di.getIt<StudyPlaceTypesBloc>(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }, (Object error, StackTrace stackTrace) {
    // Whenever an error occurs, call the `_reportError` function. This sends
    // Dart errors to the dev console or Sentry depending on the environment.
    logger.log("Error: $error", name: "runZonedGuarded error");
    logger.log("StackTrace: $stackTrace", name: "runZonedGuarded error");
  });
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ProfileForm();
  }
}
