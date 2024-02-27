import 'package:firebase_core/firebase_core.dart';

class AppConfig {
  final String appName;
  //final Environment flavor;
  //final String baseURL;
  //final String googleKey;
  final FirebaseOptions firebaseOptions;

  AppConfig(
      {required this.appName,
        //required this.flavor,
        //required this.baseURL,
        // required this.googleKey
        required this.firebaseOptions
      });
}

enum Environment { dev, uat, prod }
