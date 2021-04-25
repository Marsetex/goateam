import 'package:flutter/material.dart';

import 'package:goateam/models/team.dart';
import 'package:goateam/widgets/teams/form/team_form.dart';

class TeamEditorView extends StatefulWidget {
  final Team _team;

  TeamEditorView(this._team);

  @override
  _TeamEditorViewState createState() => _TeamEditorViewState();
}

class _TeamEditorViewState extends State<TeamEditorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TeamForm(widget._team),
    );
  }
}
