import 'package:flutter/material.dart';
import 'package:goateam/widgets/teams/list/team_list.dart';

class TeamHomeView extends StatefulWidget {
  final String title;

  TeamHomeView({Key key, this.title}) : super(key: key);

  @override
  _TeamHomeViewState createState() => _TeamHomeViewState();
}

class _TeamHomeViewState extends State<TeamHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Center(child: TeamList()),
    );
  }
}
