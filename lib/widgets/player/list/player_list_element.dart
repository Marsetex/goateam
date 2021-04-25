import 'package:flutter/material.dart';

import 'package:goateam/models/player.dart';

class PlayerListElement extends StatefulWidget {
  final Player _player;
  final void Function(Player) _removeCallback;

  PlayerListElement(this._player, this._removeCallback);

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
    // Route route = MaterialPageRoute(builder: (context) => TeamDetailView(team));
    // Navigator.push(context, route);
  }
}
