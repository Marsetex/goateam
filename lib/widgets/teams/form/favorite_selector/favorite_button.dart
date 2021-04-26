import 'package:flutter/material.dart';

class FavioriteButton extends StatefulWidget {
  @override
  _FavioriteButtonState createState() => _FavioriteButtonState();
}

class _FavioriteButtonState extends State<FavioriteButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: Colors.grey)),
          minimumSize: MaterialStateProperty.all<Size>(Size.fromHeight(60.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Mark as favorite',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.star_outline_rounded,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
