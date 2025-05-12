import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaEnterpriseProvider('mixedfeelings'),
      androidProvider: AndroidProvider.playIntegrity,
    );
