import 'package:flutter/material.dart';

import 'package:goateam/enums/bottom_navigation_views.dart';
import 'package:goateam/widgets/matchmaking/team_carousel.dart';
import 'package:goateam/widgets/shared/bottom_nav_bar/bottom_navigation_bar_wrapper.dart';

class MatchmakingHomeView extends StatefulWidget {
  MatchmakingHomeView();

  @override
  _MatchmakingHomeViewState createState() => _MatchmakingHomeViewState();
}

class _MatchmakingHomeViewState extends State<MatchmakingHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goateam"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          TeamCaousel(),
          SizedBox(
            height: 15.0,
          ),
          ElevatedButton(
            onPressed: () => {},
            child: Text('Generate'),
          ),
        ],
      ),
      bottomNavigationBar:
          BottomNavigationBarWrapper(BottomNavigationViews.matchmaking),
    );
  }
}
