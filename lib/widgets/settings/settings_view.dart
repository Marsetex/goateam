import 'package:flutter/material.dart';

import 'package:goateam/enums/bottom_navigation_views.dart';
import 'package:goateam/widgets/shared/bottom_nav_bar/bottom_navigation_bar_wrapper.dart';

class SettingsView extends StatefulWidget {
  SettingsView();

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text("Settings"),
      ),
      bottomNavigationBar:
          BottomNavigationBarWrapper(BottomNavigationViews.settings),
    );
  }
}
