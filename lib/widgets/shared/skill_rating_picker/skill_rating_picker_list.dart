import 'package:flutter/material.dart';
import 'package:goateam/models/rating_type.dart';
import 'package:goateam/utils/database/provider/rating_type_provider.dart';
import 'package:goateam/widgets/shared/skill_rating_picker/skill_rating_picker_list_option.dart';

class SkillRatingPickerList extends StatefulWidget {
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
    _ratingTypes = _getTeams();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
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
      future: _ratingTypes,
    );
  }

  Future<List<RatingType>> _getTeams() {
    return _provider.getRatingTypes();
  }

  void _onChangeCallback(String newValue) {
    setState(() {
      _pickerValue = newValue;
    });
  }
}
