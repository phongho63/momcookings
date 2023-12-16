import 'package:flutter/material.dart';
import 'package:personal_project/restart_widget.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config/app_config.dart';
import 'config/app_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppConfig devAppConfig = AppConfig(
    appName: 'Mom cooking',
  );
  Widget app = await initializeApp(devAppConfig);
  runApp(RestartWidget(child: app));
}
