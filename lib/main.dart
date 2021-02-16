import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:goateam/utils/database/adapter/goateam_database.dart';
import 'package:goateam/widgets/teams/team_home_view.dart';

void main() async {
  initApp();
  runApp(GoateamApp());
}

void initApp() {
  WidgetsFlutterBinding.ensureInitialized();
  GoateamDatabase.adapter.context;
}

class GoateamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context).helloWorld,
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
        home: TeamHomeView());
  }
}
