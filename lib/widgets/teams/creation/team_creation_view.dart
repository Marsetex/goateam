import 'dart:io';

import 'package:flutter/material.dart';
import 'package:goateam/widgets/shared/image_picker/image_picker_wrapper.dart';
import 'package:goateam/widgets/shared/skill_rating_picker/skill_rating_picker_wrapper.dart';
import 'package:goateam/widgets/teams/creation/team_creation_form.dart';
import 'package:image_picker/image_picker.dart';

class TeamCreationView extends StatefulWidget {
  @override
  _TeamCreationViewState createState() => _TeamCreationViewState();
}

class _TeamCreationViewState extends State<TeamCreationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TeamCreationForm(),
    );
  }
}
