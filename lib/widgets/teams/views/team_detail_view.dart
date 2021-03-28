import 'package:flutter/material.dart';

import 'package:goateam/models/team.dart';
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
      body: TeamDetailBody(widget._team),
    );
  }
}
