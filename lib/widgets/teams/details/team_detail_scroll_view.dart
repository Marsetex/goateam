import 'package:flutter/material.dart';

import 'package:goateam/models/team.dart';

class TeamDetailScrollView extends StatefulWidget {
  final Team _team;
  final Widget _newsListSliver;

  TeamDetailScrollView(this._team, this._newsListSliver);

  @override
  _TeamDetailScrollViewState createState() => _TeamDetailScrollViewState();
}

class _TeamDetailScrollViewState extends State<TeamDetailScrollView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          snap: false,
          floating: false,
          expandedHeight: 160.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget._team.name),
            centerTitle: true,
            background: Image.memory(widget._team.profilePic),
            stretchModes: [],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _settingModalBottomSheet(context);
              },
            ),
          ],
        ),
        widget._newsListSliver
      ],
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }
}
