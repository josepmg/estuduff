import 'dart:async';
import 'dart:developer' as logger;

import 'package:estuduff/features/auth/presentation/pages/LoginPage.dart';
import 'package:estuduff/features/environment/presentation/pages/AvailableEnviroments.dart';
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
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
    return AvailableEnviroments();
  }
}
