import 'package:flutter/material.dart';

import 'package:goateam/models/player.dart';
import 'package:goateam/widgets/player/list/player_list_element.dart';
import 'package:goateam/widgets/teams/list/team_list_empty_view.dart';

class PlayerList extends StatefulWidget {
  final void Function(Player) _removeCallback;
  Future<List<Player>> _players;

  PlayerList(this._players, this._removeCallback);

  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget._players,
      builder: (context, playersSnap) {
        if (playersSnap.connectionState == ConnectionState.done) {
          if (!playersSnap.hasData || playersSnap.hasError) {
            return TeamListEmptyView();
          }

          return ListView.builder(
              itemCount: playersSnap.data.length,
              itemBuilder: (context, index) {
                return PlayerListElement(
                    playersSnap.data[index], widget._removeCallback);
              });
        } else {
          return Text('Loading ...');
        }
      },
    );
  }
}
