import 'package:flutter/material.dart';

import 'package:goateam/models/player.dart';
import 'package:goateam/models/team.dart';
import 'package:goateam/widgets/players/form/player_form.dart';

class PlayerEditorView extends StatefulWidget {
  final Team _team;
  final Player _player;

  PlayerEditorView(this._team, this._player);

  @override
  _PlayerEditorViewState createState() => _PlayerEditorViewState();
}

class _PlayerEditorViewState extends State<PlayerEditorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PlayerForm(widget._team, widget._player),
    );
  }
}
