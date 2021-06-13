import 'dart:async';

import 'package:flutter/material.dart';

import 'package:goateam/models/player.dart';
import 'package:goateam/models/team.dart';
import 'package:goateam/utils/database/provider/player_provider.dart';
import 'package:goateam/widgets/players/list/player_list_element.dart';
import 'package:goateam/widgets/teams/details/team_detail_scroll_view.dart';

class TeamDetailBody extends StatefulWidget {
  final Team _team;

  TeamDetailBody(this._team);

  @override
  _TeamDetailBodyState createState() => _TeamDetailBodyState();
}

class _TeamDetailBodyState extends State<TeamDetailBody> {
  Future<List<Player>> _players;

  @override
  void initState() {
    super.initState();
    _players = _getPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _players,
        builder: (context, playersSnap) {
          Widget newsListSliver;

          if (playersSnap.connectionState == ConnectionState.done) {
            if (!playersSnap.hasData ||
                playersSnap.data.length == 0 ||
                playersSnap.hasError) {
              newsListSliver = SliverToBoxAdapter(
                child: Container(
                  child: Text("No Players"),
                ),
              );
            } else {
              newsListSliver = SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return PlayerListElement(
                      playersSnap.data[index], widget._team, _deletePlayer);
                }, childCount: playersSnap.data.length),
              );
            }
          } else {
            newsListSliver = SliverToBoxAdapter(
              child: CircularProgressIndicator(),
            );
          }

          return TeamDetailScrollView(widget._team, newsListSliver);
        });
  }

  Future<List<Player>> _getPlayers() {
    return PlayerProvider().getPlayers(widget._team);
  }

  void _deletePlayer(Player playerToDelete) async {
    // bool result = await PlayerProvider().deletePlayer(teamToDelete);
    // SnackBar snackBar;
    // if (result) {
    //   setState(() {
    //     _teams = _getPlayers();
    //   });
    //   snackBar = SnackBar(content: Text('Success!'));
    // } else {
    //   snackBar = SnackBar(content: Text('Fail!'));
    // }
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {
      _players = _getPlayers();
    });
  }
}
