import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:goateam/core/app_initializer.dart';
import 'package:goateam/widgets/splash_screen/splash_screen_view.dart';
import 'package:goateam/widgets/teams/views/team_home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GoateamApp());
}

void initApp() {}

class GoateamApp extends StatelessWidget {
  final Future _appInitFuture = AppInitializer.initialize();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: _appInitFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return TeamHomeView();
          } else {
            return SplashScreenView();
          }
        },
      ),
    );
  }
}
