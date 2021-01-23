import 'package:flutter/material.dart';

class TeamListElement extends StatefulWidget {
  final String teamName;

  final void Function(String) removeCallback;

  TeamListElement(this.teamName, this.removeCallback);

  @override
  _TeamListElementState createState() => _TeamListElementState();
}

class _TeamListElementState extends State<TeamListElement> {
  @override
  Widget build(BuildContext context) {
    final name = widget.teamName;

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
      onDismissed: (direction) => widget.removeCallback(name),
    );
  }
}
