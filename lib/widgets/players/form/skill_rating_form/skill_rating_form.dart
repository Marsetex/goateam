import 'package:flutter/material.dart';

import 'package:goateam/models/rating_type.dart';
import 'package:goateam/models/rating_type_attribute.dart';
import 'package:goateam/utils/database/provider/rating_type_provider.dart';
import 'package:goateam/widgets/players/form/skill_rating_form/skill_rating_form_builder.dart';

class SkillRatingForm extends StatefulWidget {
  final RatingType _skillRating;
  final Map<int, int> _ratings;
  final void Function(Map<int, int>) _skillRatingPickerCallback;

  SkillRatingForm(
      this._skillRating, this._ratings, this._skillRatingPickerCallback);

  @override
  _SkillRatingFormState createState() => _SkillRatingFormState();
}

class _SkillRatingFormState extends State<SkillRatingForm> {
  List<TextEditingController> _controllers;
  double _currentSliderValue;
  Future<List<RatingTypeAttribute>> _ratingTypeAttributes;

  @override
  void initState() {
    super.initState();

    _controllers = List.empty(growable: true);
    _currentSliderValue = 0;

    if (widget._skillRating != null) {
      _ratingTypeAttributes = RatingTypeProvider()
          .getAttributesByRatingType(widget._skillRating.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text("Skill Rating"),
            ),
          ),
          SkillRatingFormBuilder(widget._skillRating, widget._ratings,
              widget._skillRatingPickerCallback),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
