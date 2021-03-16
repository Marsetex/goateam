import 'package:flutter/material.dart';
import 'package:goateam/models/rating_type.dart';
import 'package:goateam/utils/database/provider/rating_type_provider.dart';
import 'package:goateam/widgets/shared/skill_rating_picker/skill_rating_picker_list_option.dart';

class SkillRatingPickerList extends StatefulWidget {
  final void Function(String) _skillRatingPickerCallback;

  SkillRatingPickerList(this._skillRatingPickerCallback);

  @override
  _SkillRatingPickerListState createState() => _SkillRatingPickerListState();
}

class _SkillRatingPickerListState extends State<SkillRatingPickerList> {
  final ScrollController _scrollController = new ScrollController();

  RatingTypeProvider _provider;
  Future<List<RatingType>> _ratingTypes;
  String _pickerValue;

  _SkillRatingPickerListState() {
    _provider = new RatingTypeProvider();
  }

  @override
  void initState() {
    super.initState();
    _ratingTypes = _getRatingTypes();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _ratingTypes,
      builder: (context, ratingTypeSnap) {
        if (!ratingTypeSnap.hasData || ratingTypeSnap.hasError) {
          return Text("No data");
        }

        return Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView.builder(
              controller: _scrollController,
              itemCount: ratingTypeSnap.data.length,
              itemBuilder: (context, index) {
                RatingType type = ratingTypeSnap.data[index];

                return SkillRatingPickerListOption(
                    type.name, type.name, _pickerValue, _onChangeCallback);
              }),
        );
      },
    );
  }

  Future<List<RatingType>> _getRatingTypes() {
    return _provider.getRatingTypes();
  }

  void _onChangeCallback(String newValue) async {
    setState(() {
      _pickerValue = newValue;
    });
    widget._skillRatingPickerCallback(_pickerValue);
  }
}
