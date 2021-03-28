import 'package:flutter/material.dart';

import 'package:goateam/widgets/teams/creation/team_creation_form.dart';

class TeamCreationView extends StatefulWidget {
  @override
  _TeamCreationViewState createState() => _TeamCreationViewState();
}

class _TeamCreationViewState extends State<TeamCreationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TeamCreationForm(),
    );
  }
}
