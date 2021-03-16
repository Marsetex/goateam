import 'package:flutter/material.dart';
import 'package:goateam/models/team.dart';
import 'package:goateam/widgets/teams/list/team_list_element.dart';
import 'package:goateam/widgets/teams/list/team_list_empty_view.dart';

class TeamList extends StatefulWidget {
  final void Function(Team) _removeCallback;
  Future<List<Team>> _teams;

  TeamList(this._teams, this._removeCallback);

  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget._teams,
      builder: (context, teamsSnap) {
        if (teamsSnap.connectionState == ConnectionState.done) {
          if (!teamsSnap.hasData || teamsSnap.hasError) {
            return TeamListEmptyView();
          }

          return ListView.builder(
              itemCount: teamsSnap.data.length,
              itemBuilder: (context, index) {
                return TeamListElement(
                    teamsSnap.data[index], widget._removeCallback);
              });
        } else {
          return Text('Loading ...');
        }
      },
    );
  }
}
