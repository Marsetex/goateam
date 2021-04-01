import 'package:flutter/material.dart';

import 'package:goateam/widgets/teams/form/team_form.dart';

class TeamCreatorView extends StatefulWidget {
  @override
  _TeamCreatorViewState createState() => _TeamCreatorViewState();
}

class _TeamCreatorViewState extends State<TeamCreatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TeamForm(null),
    );
  }
}
