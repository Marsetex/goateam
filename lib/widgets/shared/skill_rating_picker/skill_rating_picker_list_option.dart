import 'package:flutter/material.dart';

class SkillRatingPickerListOption extends StatefulWidget {
  final String _optionText;
  final String _optionValue;
  final String _pickerValue;
  final void Function(String) _onChangeCallback;

  SkillRatingPickerListOption(this._optionText, this._optionValue,
      this._pickerValue, this._onChangeCallback);

  @override
  _SkillRatingPickerListOptionState createState() =>
      _SkillRatingPickerListOptionState();
}

class _SkillRatingPickerListOptionState
    extends State<SkillRatingPickerListOption> {
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      title: Text(widget._optionText),
      leading: Radio(
        value: widget._optionValue,
        groupValue: widget._pickerValue,
        onChanged: (String value) {
          widget._onChangeCallback(value);
        },
      ),
    );
  }
}
