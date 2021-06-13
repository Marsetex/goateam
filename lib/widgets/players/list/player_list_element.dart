import 'package:flutter/material.dart';

import 'package:goateam/models/player.dart';
import 'package:goateam/models/team.dart';
import 'package:goateam/widgets/players/views/player_editor_view.dart';

class PlayerListElement extends StatefulWidget {
  final Player _player;
  final Team _team;
  final void Function(Player) _removeCallback;

  PlayerListElement(this._player, this._team, this._removeCallback);

  @override
  _PlayerListElementState createState() => _PlayerListElementState();
}

class _PlayerListElementState extends State<PlayerListElement> {
  @override
  Widget build(BuildContext context) {
    final name = widget._player.name;

    return Dismissible(
      key: ValueKey(name),
      child: ListTile(
        leading: _getAvatar(),
        title: Text(name),
        onTap: () => _handleOnTap(widget._player),
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
      onDismissed: (direction) => widget._removeCallback(widget._player),
    );
  }

  Widget _getAvatar() {
    return widget._player.profilePic != null
        ? CircleAvatar(backgroundImage: MemoryImage(widget._player.profilePic))
        : CircleAvatar(
            backgroundColor: Color(0xffecf0f1),
            child: Icon(
              Icons.person,
              color: Colors.purple,
            ),
          );
  }

  _handleOnTap(Player player) {
    Route route = MaterialPageRoute(
        builder: (context) => PlayerEditorView(widget._team, widget._player));
    Navigator.push(context, route);
  }
}
