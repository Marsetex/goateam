import 'package:flutter/material.dart';
import 'package:goateam/utils/database/models/team.dart';

class TeamListElement extends StatefulWidget {
  final Team team;
  final void Function(Team) removeCallback;

  TeamListElement(this.team, this.removeCallback);

  @override
  _TeamListElementState createState() => _TeamListElementState();
}

class _TeamListElementState extends State<TeamListElement> {
  @override
  Widget build(BuildContext context) {
    final name = widget.team.name;

    return Dismissible(
      key: ValueKey(name),
      child: ListTile(
        title: Text(name),
      ),
      background: Container(
        padding: EdgeInsets.only(left: 10),
        color: Colors.red,
        child: Align(
            alignment: Alignment.centerLeft, child: Icon(Icons.delete_outline)),
      ),
      secondaryBackground: Container(
        padding: EdgeInsets.only(right: 10),
        color: Colors.red,
        child: Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.delete_outline)),
      ),
      onDismissed: (direction) => widget.removeCallback(widget.team),
    );
  }
}
