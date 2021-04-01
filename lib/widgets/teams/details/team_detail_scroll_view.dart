import 'package:flutter/material.dart';

import 'package:goateam/models/team.dart';
import 'package:goateam/widgets/teams/views/team_editor_view.dart';

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Icon(Icons.maximize),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit'),
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => TeamEditorView(widget._team));
                    Navigator.push(context, route);
                    // Navigator.push(context, route).then(onGoBack);
                  },
                ),
              ],
            ),
          );
        });
  }
}
