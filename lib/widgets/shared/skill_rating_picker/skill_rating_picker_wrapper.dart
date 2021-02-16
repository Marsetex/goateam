import 'package:flutter/material.dart';
import 'package:goateam/widgets/shared/skill_rating_picker/skill_rating_picker_list.dart';

class SkillRatingPickerWrapper extends StatefulWidget {
  @override
  _SkillRatingPickerWrapperState createState() =>
      _SkillRatingPickerWrapperState();
}

class _SkillRatingPickerWrapperState extends State<SkillRatingPickerWrapper> {
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
            child: Text('Skill Rating'),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 170.0,
            child: SkillRatingPickerList(),
          ),
        ],
      ),
    );
  }
}
