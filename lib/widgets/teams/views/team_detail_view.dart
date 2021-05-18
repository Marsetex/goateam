import 'dart:async';

import 'package:flutter/material.dart';

import 'package:goateam/models/team.dart';
import 'package:goateam/widgets/players/views/player_editor_view.dart';
import 'package:goateam/widgets/teams/details/team_detail_body.dart';

class TeamDetailView extends StatefulWidget {
  final Team _team;

  TeamDetailView(this._team);

  @override
  _TeamDetailViewState createState() => _TeamDetailViewState();
}

class _TeamDetailViewState extends State<TeamDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Route route = MaterialPageRoute(
              builder: (context) => PlayerEditorView(widget._team, null));
          Navigator.push(context, route).then(_onGoBack);
        },
      ),
      body: TeamDetailBody(widget._team),
    );
  }

  FutureOr _onGoBack(dynamic value) {
    setState(() {
      //_teams = getTeams();
    });
  }
}
