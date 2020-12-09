import 'dart:async';
import 'dart:developer' as logger;

import 'package:estuduff/core/resource/routes.dart';
import 'package:estuduff/features/auth/presentation/pages/LoginPage.dart';
import 'package:estuduff/features/environment/presentation/pages/BaseEnviromentScreen.dart';
import 'package:estuduff/features/environment/presentation/pages/FilterByTypeScreen.dart';
import 'package:estuduff/features/environment/presentation/pages/SingleEnviromentScreen.dart';
import 'package:estuduff/features/profile/domain/entity/study_profile_enum.dart';
import 'package:estuduff/features/profile/presentation/pages/ProfileForm.dart';
import 'package:estuduff/features/profile/presentation/pages/select_profile_page.dart';
import 'package:flutter/material.dart';
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
    runApp(Estuduff());
  }, (Object error, StackTrace stackTrace) {
    // Whenever an error occurs, call the `_reportError` function. This sends
    // Dart errors to the dev console or Sentry depending on the environment.
    logger.log("Error: $error", name: "runZonedGuarded error");
    logger.log("StackTrace: $stackTrace", name: "runZonedGuarded error");
  });
}

class Estuduff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: <String, WidgetBuilder>{
          Routes.start_page: (BuildContext context) => LoginPage(),
          Routes.filter_type_page: (BuildContext context) =>
              FilterByTypeScreen(),
          Routes.single_env_page: (BuildContext context) =>
              SingleEnviromentScreen(),
          Routes.wolf_profile_page: (BuildContext context) =>
              BaseEnviromentScreen(
                profile: StudyProfileEnum.LONELY_WOLF,
              ),
          Routes.jack_profile_page: (BuildContext context) =>
              BaseEnviromentScreen(
                  profile: StudyProfileEnum.JACK_OF_ALL_TRADES),
          Routes.outgoing_profile_page: (BuildContext context) =>
              BaseEnviromentScreen(profile: StudyProfileEnum.OUTGOING),
          Routes.available_env_page: (BuildContext context) =>
              BaseEnviromentScreen(profile: StudyProfileEnum.AVAILABLE),
          Routes.profile_form_page: (BuildContext context) => ProfileForm(),
          Routes.switch_profile_page: (BuildContext context) =>
              SelectProfilePage(),
        });
  }
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
    return LoginPage();
  }
}
