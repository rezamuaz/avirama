import 'package:absensi_app/src/config/devices/app_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'localization/validation_locale.dart';
import 'middleware/auth_guards.dart';
import 'middleware/verify_user_guards.dart';
import 'network/domain_manager.dart';
import 'router/auto_router.gr.dart';
import 'services/auth_service.dart';
import 'services/local_notification.dart';
import 'services/user_prefs.dart';
import 'theme/themes.dart';

Future initializeApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(XTheme.barOverLayStyle);

  _locator();

  ValidationBuilder.globalLocale = XValidationLocale();
  timeago.setLocaleMessages('id', timeago.IdMessages());

  await Future.wait([
    Firebase.initializeApp(),
    // AnalyticsService.instance.init(),
    AppInfo.initialize(),
    Auth.instance.initialize(),
    UserPrefs.instance.initialize(),
    dotenv.load(fileName: ".env"),
    GetStorage.init(),
  ]);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    LocalNotification.showNotification(message);
  });

  LocalNotification().notificationHandler();
}

void _locator() {
  GetIt.I.registerLazySingleton(() => DomainManager());
  GetIt.I.registerLazySingleton(() => XRouter(
        authGuard: AuthGuard(),
        verifyUserGuard: VerifyUserGuard(),
      ));
}
