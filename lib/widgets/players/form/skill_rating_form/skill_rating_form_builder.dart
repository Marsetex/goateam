import 'package:flutter/material.dart';

import 'package:goateam/models/rating_type.dart';
import 'package:goateam/models/rating_type_attribute.dart';
import 'package:goateam/utils/database/provider/rating_type_provider.dart';

class SkillRatingFormBuilder extends StatefulWidget {
  final RatingType _skillRating;
  final Map<int, int> _ratings;
  final void Function(Map<int, int>) _skillRatingPickerCallback;

  SkillRatingFormBuilder(
      this._skillRating, this._ratings, this._skillRatingPickerCallback);

  @override
  _SkillRatingFormBuilderState createState() => _SkillRatingFormBuilderState();
}

class _SkillRatingFormBuilderState extends State<SkillRatingFormBuilder> {
  Map<int, int> _skillRatingValues;
  Future<List<RatingTypeAttribute>> _ratingTypeAttributes;

  @override
  void initState() {
    super.initState();

    _skillRatingValues = new Map<int, int>();

    if (widget._skillRating != null) {
      _ratingTypeAttributes = RatingTypeProvider()
          .getAttributesByRatingType(widget._skillRating.id);
    }

    if (widget._ratings != null) {
      _skillRatingValues = widget._ratings;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RatingTypeAttribute>>(
      future: _ratingTypeAttributes,
      builder: (context, ratingTypeAttributes) {
        if (ratingTypeAttributes.connectionState == ConnectionState.done) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: ratingTypeAttributes.data.length,
              itemBuilder: (context, index) {
                int ratingTypeAttributeId = ratingTypeAttributes.data[index].id;
                _skillRatingValues.putIfAbsent(ratingTypeAttributeId, () => 0);

                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 70,
                            child: Text(ratingTypeAttributes.data[index].name),
                          ),
                          Expanded(
                            child: Slider(
                              value: _skillRatingValues[ratingTypeAttributeId]
                                  .toDouble(),
                              min: 0,
                              max: 10,
                              divisions: 10,
                              label: _skillRatingValues[ratingTypeAttributeId]
                                  .toString(),
                              onChanged: (double value) {
                                _handleOnChange(
                                    ratingTypeAttributeId, value.toInt());
                              },
                            ),
                          ),
                          Container(
                            width: 20,
                            child: Text(
                                _skillRatingValues[ratingTypeAttributeId]
                                    .toString()),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
        } else {
          return Container();
        }
      },
    );
  }

  void _handleOnChange(int ratingTypeAttributeId, int value) {
    setState(() {
      _skillRatingValues[ratingTypeAttributeId] = value;
    });
    widget._skillRatingPickerCallback(_skillRatingValues);
  }
}
