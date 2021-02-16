import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:goateam/widgets/teams/creation/team_creation_view.dart';
import 'package:goateam/widgets/teams/list/team_list.dart';

class TeamHomeView extends StatefulWidget {
  @override
  _TeamHomeViewState createState() => _TeamHomeViewState();
}

class _TeamHomeViewState extends State<TeamHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).helloWorld),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TeamCreationView()),
          );
        },
      ),
      body: Center(child: TeamList()),
    );
  }
}
