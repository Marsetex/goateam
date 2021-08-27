import 'dart:async';

import 'package:flutter/material.dart';

import 'package:goateam/models/player.dart';
import 'package:goateam/models/team.dart';
import 'package:goateam/utils/database/provider/player_provider.dart';
import 'package:goateam/widgets/players/views/player_editor_view.dart';
import 'package:goateam/widgets/teams/details/team_detail_body.dart';

class TeamDetailView extends StatefulWidget {
  final Team _team;

  TeamDetailView(this._team);

  @override
  _TeamDetailViewState createState() => _TeamDetailViewState();
}

class _TeamDetailViewState extends State<TeamDetailView> {
  Future<List<Player>> _players;

  @override
  void initState() {
    super.initState();
    _players = _getPlayers();
  }

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
      body: TeamDetailBody(widget._team, _players),
    );
  }

  Future<List<Player>> _getPlayers() {
    return PlayerProvider().getPlayersOfTeam(widget._team);
  }

  FutureOr _onGoBack(dynamic value) {
    setState(() {
      _players = _getPlayers();
    });
  }
}
