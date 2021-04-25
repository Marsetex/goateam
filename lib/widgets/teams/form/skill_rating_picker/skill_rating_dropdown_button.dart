import 'package:flutter/material.dart';

import 'package:goateam/models/rating_type.dart';
import 'package:goateam/utils/database/provider/rating_type_provider.dart';

class SkillRatingDropdownButton extends StatefulWidget {
  final RatingType _skillRating;
  final void Function(RatingType) _skillRatingPickerCallback;

  SkillRatingDropdownButton(this._skillRating, this._skillRatingPickerCallback);

  @override
  _SkillRatingDropdownButtonState createState() =>
      _SkillRatingDropdownButtonState();
}

class _SkillRatingDropdownButtonState extends State<SkillRatingDropdownButton> {
  RatingTypeProvider _provider;

  Future<List<RatingType>> _ratingTypes;
  RatingType _pickerValue;

  _SkillRatingDropdownButtonState() {
    _provider = new RatingTypeProvider();
  }

  @override
  void initState() {
    super.initState();

    _ratingTypes = _getRatingTypes();
    _pickerValue = widget._skillRating;
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List<RatingType>>(
      future: _ratingTypes,
      builder: (context, ratingTypeSnap) {
        if (ratingTypeSnap.connectionState == ConnectionState.done) {
          if (!ratingTypeSnap.hasData || ratingTypeSnap.hasError) {
            return Text("No data");
          }

          if (_pickerValue != null) {
            return DropdownButtonFormField(
              items: ratingTypeSnap.data.map((RatingType ratingType) {
                return new DropdownMenuItem(
                    value: ratingType, child: Text(ratingType.name));
              }).toList(),
              onChanged: (newValue) => _onChangeCallback(newValue),
              value: _pickerValue,
              validator: (value) {
                if (value == null) {
                  return 'Fail';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Skill rating',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB00020)),
                ),
              ),
            );
          }

          return DropdownButtonFormField(
            items: ratingTypeSnap.data.map((RatingType ratingType) {
              return new DropdownMenuItem(
                  value: ratingType, child: Text(ratingType.name));
            }).toList(),
            onChanged: (newValue) => _onChangeCallback(newValue),
            validator: (value) {
              if (value == null) {
                return 'Fail';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Skill rating',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFB00020)),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Future<List<RatingType>> _getRatingTypes() {
    return _provider.getRatingTypes();
  }

  void _onChangeCallback(RatingType newValue) {
    setState(() {
      _pickerValue = newValue;
    });
    widget._skillRatingPickerCallback(_pickerValue);
  }
}
