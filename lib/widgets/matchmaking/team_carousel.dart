import 'package:flutter/material.dart';

class TeamCaousel extends StatefulWidget {
  TeamCaousel();

  @override
  _TeamCaouselState createState() => _TeamCaouselState();
}

class _TeamCaouselState extends State<TeamCaousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 275.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemCount: 5,
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(itemIndex);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(int itemIndex) {
    return Column(
      children: <Widget>[
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 250.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: Text("Text"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
