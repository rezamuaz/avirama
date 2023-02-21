import 'dart:async';

import 'package:camera/camera.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/features/common/app_bloc/bloc_observer.dart';
import 'src/locator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();

  final cameras = await availableCameras();
  runZonedGuarded(() {
    return BlocOverrides.runZoned(
      () {
        runApp(MyApp(cameras: cameras));
        FlutterImageCompress.showNativeLog = true;
      },
      blocObserver: XBlocObserver(),
    );
  }, FirebaseCrashlytics.instance.recordError);
}

Widget daftar_provider({var cameras}) {
  return MultiProvider(
    providers: [],
    child: BlocOverrides.runZoned(
      () {
        runApp(MyApp(cameras: cameras));
      },
      blocObserver: XBlocObserver(),
    ),
  );
}

// flutter pub run build_runner build --delete-conflicting-outputs
