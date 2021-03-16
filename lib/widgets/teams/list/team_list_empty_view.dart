import 'package:flutter/material.dart';

class TeamListEmptyView extends StatefulWidget {
  @override
  _TeamListEmptyViewState createState() => _TeamListEmptyViewState();
}

class _TeamListEmptyViewState extends State<TeamListEmptyView> {
  @override
  Widget build(BuildContext context) {
    return Text('Please create a team.');
  }
}
