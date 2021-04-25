import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:goateam/models/rating_type.dart';
import 'package:goateam/models/team.dart';
import 'package:goateam/utils/database/provider/team_provider.dart';
import 'package:goateam/widgets/shared/image_picker/image_picker_wrapper.dart';
// import 'package:goateam/widgets/teams/form/favorite_selector/favorite_button.dart';
import 'package:goateam/widgets/teams/form/skill_rating_picker/skill_rating_picker.dart';

class TeamForm extends StatefulWidget {
  final Team _team;

  TeamForm(this._team);

  @override
  _TeamFormState createState() => _TeamFormState();
}

class _TeamFormState extends State<TeamForm> {
  final _formKey = GlobalKey<FormState>();
  final _teamNameController = new TextEditingController();

  Uint8List _rawImage;
  RatingType _ratingType;

  @override
  void initState() {
    super.initState();

    if (widget._team != null) {
      _teamNameController.text = widget._team.name;
      _rawImage = widget._team.profilePic;
      _ratingType = widget._team.ratingType;
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
                  controller: _teamNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter team name',
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
                SkillRatingPicker(_ratingType, _getSkillRatingFromPicker),
                SizedBox(
                  height: 15.0,
                ),
                // FavioriteButton(),
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

  _getSkillRatingFromPicker(RatingType skillRating) {
    _ratingType = skillRating;
  }

  _handleOnPressed() async {
    var newTeam = Team(_teamNameController.text, _ratingType, _rawImage, false);
    await TeamProvider().insertTeam(newTeam);
    Navigator.pop(context);
  }
}
