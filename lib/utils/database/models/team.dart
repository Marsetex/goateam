import 'package:goateam/utils/database/constants/database_constants.dart';

class Team {
  int _id;
  String _name;
  String _profilePic;

  Team(this._id, this._name, this._profilePic);

  int get id => _id;

  String get name => _name;

  String get profilePic => _profilePic;

  set id(int id) {
    this._id = id;
  }

  set name(String name) {
    this._name = name;
  }

  set profilePic(String profilePic) {
    this._profilePic = profilePic;
  }

  Map<String, dynamic> toMap() {
    return {
      '${DatabaseConstants.TEM_C_TEAM_ID}': _id,
      '${DatabaseConstants.TEM_C_TEAM_NAME}': _name,
      '${DatabaseConstants.TEM_C_PROFILE_PIC}': _profilePic,
    };
  }

  Team.toList(Map<String, dynamic> map) {
    this._id = map['${DatabaseConstants.TEM_C_TEAM_ID}'];
    this._name = map['${DatabaseConstants.TEM_C_TEAM_NAME}'];
    this._profilePic = map['${DatabaseConstants.TEM_C_PROFILE_PIC}'];
  }
}
