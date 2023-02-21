import 'package:auto_route/auto_route.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'features/auth/logic/auth_bloc.dart';
import 'features/common/setting/setting_bloc.dart';
import 'localization/locale_resolution_callback.dart';
import 'localization/localization_utils.dart';
import 'router/auto_router.gr.dart';
import 'theme/themes.dart';

class MyApp extends StatefulWidget {
  var cameras;

  MyApp({super.key, this.cameras});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<XRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingBloc()),
        BlocProvider(
          create: (_) => AuthBloc(),
        ),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
        return FirebasePhoneAuthProvider(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              // Locale('en', ''),
              Locale('id', ''),
            ],
            localeResolutionCallback: (uL, sLs) =>
                localeResolutionCallback(uL, sLs, state),
            locale: state.locale,
            theme: XTheme.light(),
            // ! uncomment this line to use dark theme
            // darkTheme: XTheme.dark(),
            themeMode: state.themeMode,
            routeInformationParser:
                appRouter.defaultRouteParser(includePrefixMatches: true),
            routerDelegate: AutoRouterDelegate(
              appRouter,
            ),
          ),
        );
      }),
    );
  }
}
