import 'package:flutter/material.dart';
import 'package:goateam/core/team_list_element.dart';

class TeamList extends StatefulWidget {
  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  final _teams = <String>["Team 1", "team 2", "Team 3"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // padding: EdgeInsets.all(20.0),
        itemCount: _teams.length,
        itemBuilder: (context, i) {
          // if (i.isOdd) {
          //   return Divider();
          // }

          return TeamListElement(_teams[i], removeTeam);
        });
  }

  void removeTeam(String teamName) {
    setState(() {
      _teams.removeWhere((element) => element == teamName);
    });
  }
}
