import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:goateam/models/player.dart';
import 'package:goateam/models/rating_type.dart';
import 'package:goateam/models/team.dart';
import 'package:goateam/utils/database/provider/player_provider.dart';
import 'package:goateam/widgets/players/form/skill_rating_form/skill_rating_form.dart';
import 'package:goateam/widgets/shared/image_picker/image_picker_wrapper.dart';

class PlayerForm extends StatefulWidget {
  final Team _team;
  final Player _player;

  PlayerForm(this._team, this._player);

  @override
  _PlayerFormState createState() => _PlayerFormState();
}

class _PlayerFormState extends State<PlayerForm> {
  final _formKey = GlobalKey<FormState>();
  final _playerNameController = new TextEditingController();

  Uint8List _rawImage;
  RatingType _ratingType;
  Map<int, int> _ratings;

  @override
  void initState() {
    super.initState();

    if (widget._team != null) {
      _ratingType = widget._team.ratingType;

      if (widget._player != null) {
        _playerNameController.text = widget._player.name;
        _rawImage = widget._player.profilePic;

        _ratings = new Map<int, int>();

        widget._player.ratings.forEach((element) {
          _ratings.putIfAbsent(element.ratingTypeAttributeId,
              () => element.ratingAttributeValue);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                ImagePickerWrapper(_rawImage, _getImageFromPicker),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: _playerNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter player name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                SkillRatingForm(
                    _ratingType, _ratings, _getSkillRatingFromPicker),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _handleOnPressed();
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _getImageFromPicker(Uint8List rawImage) {
    _rawImage = rawImage;
  }

  _getSkillRatingFromPicker(Map<int, int> skillRatings) {
    _ratings = skillRatings;
  }

  _handleOnPressed() async {
    var newPlayer = new Player(_playerNameController.text, _rawImage, -1);

    await PlayerProvider().insertPlayer(newPlayer, widget._team, _ratings);
    Navigator.pop(context);
  }
}
