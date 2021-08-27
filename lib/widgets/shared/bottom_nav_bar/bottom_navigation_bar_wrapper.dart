import 'package:flutter/material.dart';

import 'package:goateam/enums/bottom_navigation_views.dart';
import 'package:goateam/widgets/matchmaking/matchmaking_view.dart';
import 'package:goateam/widgets/settings/settings_view.dart';
import 'package:goateam/widgets/teams/views/team_home_view.dart';

class BottomNavigationBarWrapper extends StatefulWidget {
  final BottomNavigationViews _view;

  BottomNavigationBarWrapper(this._view);

  @override
  _BottomNavigationBarWrapperState createState() =>
      _BottomNavigationBarWrapperState();
}

class _BottomNavigationBarWrapperState
    extends State<BottomNavigationBarWrapper> {
  final List<Widget> _navBarWidgets = <Widget>[
    MatchmakingHomeView(),
    TeamHomeView(),
    SettingsView()
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    setState(() {
      _selectedIndex = _mapViewToIndex(widget._view);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.wifi),
          label: 'Matchmaking',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Teams',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onNavBarItemTapped,
    );
  }

  void _onNavBarItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              _navBarWidgets[index],
          transitionDuration: Duration(seconds: 0),
        ),
      );
      // Navigator.popAndPushNamed(context, '/second');

      // Navigator.push(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (context, animation1, animation2) =>
      //         _navBarWidgets[index],
      //     transitionDuration: Duration(seconds: 0),
      //   ),
      // );
    }
  }

  int _mapViewToIndex(BottomNavigationViews view) {
    switch (view) {
      case BottomNavigationViews.matchmaking:
        return 0;
      case BottomNavigationViews.teams:
        return 1;
      case BottomNavigationViews.settings:
        return 2;
      default:
        return 0;
    }
  }
}
