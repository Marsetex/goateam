import 'dart:async';

import 'package:flutter/material.dart';

import 'package:goateam/models/player.dart';
import 'package:goateam/models/team.dart';
import 'package:goateam/widgets/players/list/player_silverlist.dart';
import 'package:goateam/widgets/teams/details/team_detail_scroll_view.dart';

class TeamDetailBody extends StatefulWidget {
  final Team _team;
  final Future<List<Player>> _players;

  TeamDetailBody(this._team, this._players);

  @override
  _TeamDetailBodyState createState() => _TeamDetailBodyState();
}

class _TeamDetailBodyState extends State<TeamDetailBody> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget._players,
        builder: (context, playersSnap) {
          Widget scrollViewBody;

          if (playersSnap.connectionState == ConnectionState.done) {
            if (!playersSnap.hasData ||
                playersSnap.data.length == 0 ||
                playersSnap.hasError) {
              scrollViewBody = SliverToBoxAdapter(
                child: Container(
                  child: Text("No Players"),
                ),
              );
            } else {
              scrollViewBody = PlayerSilverList(widget._team, playersSnap);
            }
          } else {
            scrollViewBody = SliverToBoxAdapter(
              child: CircularProgressIndicator(),
            );
          }

          return TeamDetailScrollView(widget._team, scrollViewBody);
        });
  }
}
