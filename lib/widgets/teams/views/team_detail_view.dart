import 'dart:async';

import 'package:flutter/material.dart';

import 'package:goateam/models/player.dart';
import 'package:goateam/models/team.dart';
import 'package:goateam/utils/database/provider/player_provider.dart';
import 'package:goateam/widgets/player/list/player_list.dart';

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
      appBar: AppBar(
        title: Text(widget._team.name),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _settingModalBottomSheet(context);
            },
          ),
        ],
      ),
      body: Container(
        child: PlayerList(_players, _deletePlayer),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }

  Future<List<Player>> _getPlayers() {
    return PlayerProvider().getPlayers();
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
