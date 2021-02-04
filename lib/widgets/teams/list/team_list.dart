import 'package:flutter/material.dart';
import 'package:goateam/utils/database/models/team.dart';
import 'package:goateam/utils/database/provider/team_provider.dart';
import 'package:goateam/widgets/teams/list/team_list_element.dart';

class TeamList extends StatefulWidget {
  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  TeamProvider _provider;
  Future<List<Team>> _teams;

  _TeamListState() {
    _provider = new TeamProvider();
  }

  @override
  void initState() {
    super.initState();
    _teams = getTeams();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, teamsSnap) {
        if (!teamsSnap.hasData || teamsSnap.hasError) {
          return Text("No data");
        }

        return ListView.builder(
            // padding: EdgeInsets.all(20.0),
            itemCount: teamsSnap.data.length,
            itemBuilder: (context, index) {
              return TeamListElement(teamsSnap.data[index], deleteTeam);
            });
      },
      future: _teams,
    );
  }

  Future<List<Team>> getTeams() {
    return _provider.getTeams();
  }

  void deleteTeam(Team teamToDelete) async {
    var result = await _provider.deleteTeam(teamToDelete);
    if (result > 0) {
      setState(() {
        _teams = getTeams();
      });
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Success"),
      ));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Fail"),
      ));
    }
  }
}
