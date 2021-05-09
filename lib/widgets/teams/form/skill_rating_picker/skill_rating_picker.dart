import 'package:flutter/material.dart';

import 'package:goateam/models/rating_type.dart';
import 'package:goateam/widgets/teams/form/skill_rating_picker/skill_rating_description_card.dart';
import 'package:goateam/widgets/teams/form/skill_rating_picker/skill_rating_dropdown_button.dart';

class SkillRatingPicker extends StatefulWidget {
  final RatingType _skillRating;
  final void Function(RatingType) _skillRatingPickerCallback;

  SkillRatingPicker(this._skillRating, this._skillRatingPickerCallback);

  @override
  _SkillRatingPickerState createState() => _SkillRatingPickerState();
}

class _SkillRatingPickerState extends State<SkillRatingPicker> {
  RatingType _pickerValue;

  @override
  void initState() {
    super.initState();

    _pickerValue = widget._skillRating;
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SkillRatingDropdownButton(_pickerValue, _onChangeCallback),
        _getSizedBox(),
        SkillRatingDescriptionCard(_pickerValue),
      ],
    );
  }

  void _onChangeCallback(RatingType newValue) {
    setState(() {
      _pickerValue = newValue;
    });
    widget._skillRatingPickerCallback(_pickerValue);
  }

  Widget _getSizedBox() {
    return _pickerValue != null
        ? SizedBox(
            height: 15.0,
          )
        : Container();
  }
}
