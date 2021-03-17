import 'package:flutter/material.dart';

import 'package:goateam/models/team.dart';

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
      appBar: AppBar(
        title: Text(widget._team.name),
      ),
    );
  }
}
