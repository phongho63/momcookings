import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../app/pages/onboarding/startup/startup_view.dart';
import '../app/utils/global.dart';
import '../data/network/constants.dart';
import 'dart:async';

import 'app_config.dart';

Future<Widget> initializeApp(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase(appConfig);
  await getAppVersion();
  await getDeviceLang();
  return MyApp(appConfig);
}

class MyApp extends StatefulWidget {
  final AppConfig appConfig;

  MyApp(this.appConfig, {Key? key}) : super(key: key) {
    //set base url
    //Constants.baseUrl = appConfig.baseURL;
    //Global.mGoogleKey = appConfig.googleKey;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  Timer? _timer;
  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("App is return");
        _startTimer();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        debugPrint("App is pause");
        _stopTimer(); // Conservatively set a timer on all three
        break;
    }
  }

  void _startTimer() {
    _timer ??= Timer.periodic(const Duration(minutes: 5), (timer) {});
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mom cooking',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorScheme: ColorScheme.light(
          primary: HexColor(Global.mColors["blue_1"].toString()),
          onPrimary: Colors.white,
        ),
      ),
      localizationsDelegates: const [
        MonthYearPickerLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      home: StartupView(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    );
  }
}

Future<void> initFirebase(AppConfig appConfig) async {
  await Firebase.initializeApp(name: "Moms-cooking", options: appConfig.firebaseOptions);
}

Future<void> getAppVersion() async {
  /// App version
  final info = await PackageInfo.fromPlatform();
  Global.appVersion = info.version;
}

/// Get device language to set for app language
Future<void> getDeviceLang() async {
  Global.mLang = window.locale.languageCode;
}
