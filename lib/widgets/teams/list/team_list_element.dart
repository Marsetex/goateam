import 'package:flutter/material.dart';

import 'package:goateam/models/team.dart';
import 'package:goateam/widgets/teams/views/team_detail_view.dart';

class TeamListElement extends StatefulWidget {
  final Team _team;
  final void Function(Team) _removeCallback;

  TeamListElement(this._team, this._removeCallback);

  @override
  _TeamListElementState createState() => _TeamListElementState();
}

class _TeamListElementState extends State<TeamListElement> {
  @override
  Widget build(BuildContext context) {
    final name = widget._team.name;

    return Dismissible(
      key: ValueKey(name),
      child: ListTile(
        leading: _getAvatar(),
        title: Text(name),
        onTap: () => _handleOnTap(widget._team),
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
      onDismissed: (direction) => widget._removeCallback(widget._team),
    );
  }

  Widget _getAvatar() {
    return widget._team.profilePic != null
        ? CircleAvatar(backgroundImage: MemoryImage(widget._team.profilePic))
        : CircleAvatar(
            backgroundColor: Color(0xffecf0f1),
            child: Icon(
              Icons.person,
              color: Colors.purple,
            ),
          );
  }

  _handleOnTap(Team team) {
    Route route = MaterialPageRoute(builder: (context) => TeamDetailView(team));
    Navigator.push(context, route);
  }
}
