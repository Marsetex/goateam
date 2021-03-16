import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:goateam/models/rating_type.dart';
import 'package:goateam/models/team.dart';
import 'package:goateam/utils/database/provider/rating_type_provider.dart';
import 'package:goateam/utils/database/provider/team_provider.dart';
import 'package:goateam/widgets/shared/image_picker/image_picker_wrapper.dart';
import 'package:goateam/widgets/shared/skill_rating_picker/skill_rating_picker_wrapper.dart';

class TeamCreationForm extends StatefulWidget {
  @override
  _TeamCreationFormState createState() => _TeamCreationFormState();
}

class _TeamCreationFormState extends State<TeamCreationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();

  Uint8List _rawImage;
  RatingType _ratingType;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ImagePickerWrapper(_getImageFromPicker),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: emailController,
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
                SkillRatingPickerWrapper(_getSkillRatingFromPicker),
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

  _getSkillRatingFromPicker(String skillRatingName) async {
    _ratingType =
        await RatingTypeProvider().getRatingTypeByName(skillRatingName);
  }

  _handleOnPressed() async {
    var newTeam = Team(emailController.text, _ratingType.id, _rawImage, false);
    await TeamProvider().insertTeam(newTeam);
    Navigator.pop(context);
  }
}
