import 'package:flutter/material.dart';

import 'package:goateam/models/player.dart';
import 'package:goateam/models/team.dart';
import 'package:goateam/widgets/players/list/player_list_element.dart';

class PlayerSilverList extends StatefulWidget {
  final Team _team;
  final AsyncSnapshot _playerSnap;

  PlayerSilverList(this._team, this._playerSnap);

  @override
  _PlayerSilverListState createState() => _PlayerSilverListState();
}

class _PlayerSilverListState extends State<PlayerSilverList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return PlayerListElement(
            widget._playerSnap.data[index], widget._team, _deletePlayer);
      }, childCount: widget._playerSnap.data.length),
    );
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
}
