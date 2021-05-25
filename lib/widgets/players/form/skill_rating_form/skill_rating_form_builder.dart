import 'package:flutter/material.dart';

import 'package:goateam/models/rating_type.dart';
import 'package:goateam/models/rating_type_attribute.dart';
import 'package:goateam/utils/database/provider/rating_type_provider.dart';

class SkillRatingFormBuilder extends StatefulWidget {
  final RatingType _skillRating;
  final void Function(RatingType) _skillRatingPickerCallback;

  SkillRatingFormBuilder(this._skillRating, this._skillRatingPickerCallback);

  @override
  _SkillRatingFormBuilderState createState() => _SkillRatingFormBuilderState();
}

class _SkillRatingFormBuilderState extends State<SkillRatingFormBuilder> {
  List<double> _skillRatingValues;
  Future<List<RatingTypeAttribute>> _ratingTypeAttributes;

  @override
  void initState() {
    super.initState();

    _skillRatingValues = [];

    if (widget._skillRating != null) {
      _ratingTypeAttributes = RatingTypeProvider()
          .getAttributesByRatingType(widget._skillRating.id);
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
                _skillRatingValues.add(0.0);

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
                              value: _skillRatingValues[index],
                              min: 0,
                              max: 10,
                              divisions: 10,
                              label:
                                  _skillRatingValues[index].toInt().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _skillRatingValues[index] = value;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: 20,
                            child: Text(
                                _skillRatingValues[index].toInt().toString()),
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
}
