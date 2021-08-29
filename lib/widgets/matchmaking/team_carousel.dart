import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:goateam/models/team.dart';
import 'package:goateam/utils/database/provider/team_provider.dart';

class TeamCaousel extends StatefulWidget {
  TeamCaousel();

  @override
  _TeamCaouselState createState() => _TeamCaouselState();
}

class _TeamCaouselState extends State<TeamCaousel> {
  Future<List<Team>> _teams;

  @override
  void initState() {
    super.initState();
    _teams = _getTeams();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _teams,
      builder: (context, teamsSnap) {
        if (teamsSnap.connectionState == ConnectionState.done) {
          if (!teamsSnap.hasData || teamsSnap.hasError) {
            return Container();
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 275.0,
                child: PageView.builder(
                  // store this controller in a State to save the carousel scroll position
                  controller: PageController(viewportFraction: 0.8),
                  itemCount: teamsSnap.data.length,
                  itemBuilder: (BuildContext context, int itemIndex) {
                    return _buildCarouselItem(
                        itemIndex, teamsSnap.data[itemIndex]);
                  },
                ),
              ),
            ],
          );
        } else {
          return Text('Loading ...');
        }
      },
    );
  }

  Future<List<Team>> _getTeams() {
    return TeamProvider().getTeams();
  }

  Widget _buildCarouselItem(int itemIndex, Team team) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 225.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
                image: _getDecorationImage(team.profilePic),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4.0),
                  bottomRight: Radius.circular(4.0),
                ),
              ),
              child: Text(
                team.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  DecorationImage _getDecorationImage(Uint8List profilePic) {
    if (profilePic == null) {
      return null;
    }

    return new DecorationImage(
      image: MemoryImage(profilePic),
      fit: BoxFit.fill,
    );
  }
}
