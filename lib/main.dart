import 'package:flutter/material.dart';
import 'package:personal_project/restart_widget.dart';

import 'config/app_config.dart';
import 'config/app_init.dart';
import 'firebase_options.dart';

Future<void> main() async {
  AppConfig devAppConfig = AppConfig(
    appName: 'Mom cooking',
    firebaseOptions: DefaultFirebaseOptions.currentPlatform
  );
  Widget app = await initializeApp(devAppConfig);
  runApp(RestartWidget(child: app));
}
