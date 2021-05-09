import 'package:flutter/material.dart';

import 'package:goateam/models/rating_type.dart';

class SkillRatingDescriptionCard extends StatefulWidget {
  final RatingType _skillRating;

  SkillRatingDescriptionCard(this._skillRating);

  @override
  _SkillRatingDescriptionCardState createState() =>
      _SkillRatingDescriptionCardState();
}

class _SkillRatingDescriptionCardState
    extends State<SkillRatingDescriptionCard> {
  bool selected = false;

  Widget build(BuildContext context) {
    return widget._skillRating != null ? _generateCard() : Container();
  }

  Widget _generateCard() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: Colors.lightGreen),
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              child: Text(widget._skillRating.name),
            ),
            Container(
              child: Text(
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr," +
                      " sed diam nonumy eirmod tempor invidunt ut labore et dolore magna " +
                      "aliquyam erat, sed diam voluptua."),
            ),
          ],
        ));
  }

  // Widget _generateCollapsibleCard() {
  //   return GestureDetector(
  //     child: new Container(
  //       child: new Text("CLICK ME"),
  //       color: Colors.blueAccent,
  //       height: 25.0,
  //       width: 100.0,
  //     ),
  //     onTap: () {
  //       setState(() {
  //         selected = !selected;
  //       });
  //     },
  //     child: AnimatedContainer(
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(4.0)),
  //           color: Colors.lightGreen),
  //       height: selected ? 100.0 : 200.0,
  //       alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
  //       duration: const Duration(seconds: 2),
  //       curve: Curves.fastOutSlowIn,
  //       child: const FlutterLogo(size: 75),
  //     ),
  //   );
  // }
}
