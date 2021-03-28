import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:goateam/models/team.dart';
import 'package:goateam/utils/database/provider/team_provider.dart';
import 'package:goateam/widgets/teams/views/team_creation_view.dart';
import 'package:goateam/widgets/teams/list/team_list.dart';

class TeamHomeView extends StatefulWidget {
  @override
  _TeamHomeViewState createState() => _TeamHomeViewState();
}

class _TeamHomeViewState extends State<TeamHomeView> {
  Future<List<Team>> _teams;

  @override
  void initState() {
    super.initState();
    _teams = getTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).helloWorld),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Route route =
              MaterialPageRoute(builder: (context) => TeamCreationView());
          Navigator.push(context, route).then(onGoBack);
        },
      ),
      body: Container(child: TeamList(_teams, deleteTeam)),
    );
  }

  Future<List<Team>> getTeams() {
    return TeamProvider().getTeams();
  }

  void deleteTeam(Team teamToDelete) async {
    bool result = await TeamProvider().deleteTeam(teamToDelete);
    SnackBar snackBar;
    if (result) {
      setState(() {
        _teams = getTeams();
      });
      snackBar = SnackBar(content: Text('Success!'));
    } else {
      snackBar = SnackBar(content: Text('Fail!'));
    }
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {
      _teams = getTeams();
    });
  }
}
