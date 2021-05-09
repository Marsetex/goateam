import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool _favoriteValue;
  final void Function(bool) _favoriteButtonValueCallback;

  FavoriteButton(this._favoriteValue, this._favoriteButtonValueCallback);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _favValue;

  @override
  void initState() {
    super.initState();
    _favValue = widget._favoriteValue;
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => _handleOnPress(),
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
            _getFavoriteIcon(),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  void _handleOnPress() {
    setState(() {
      _favValue = !_favValue;
    });
    widget._favoriteButtonValueCallback(_favValue);
  }

  IconData _getFavoriteIcon() {
    return _favValue ? Icons.star_rounded : Icons.star_outline_rounded;
  }
}
