import 'dart:typed_data';

import 'package:goateam/utils/database/constants/database_constants.dart';

class Team {
  int _id;
  String _name;
  int _ratingTypeId;
  Uint8List _profilePic;
  bool _favorite;

  Team(this._name, this._ratingTypeId, this._profilePic, this._favorite);

  int get id => _id;

  String get name => _name;

  set name(String name) {
    this._name = name;
  }

  int get ratingTypeId => _ratingTypeId;

  set ratingTypeId(int ratingTypeId) {
    this._ratingTypeId = ratingTypeId;
  }

  Uint8List get profilePic => _profilePic;

  set profilePic(Uint8List profilePic) {
    this._profilePic = profilePic;
  }

  bool get favorite => _favorite;

  set favorite(bool favorite) {
    this._favorite = favorite;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['${DatabaseConstants.TEM_C_TEAM_ID}'] = _id;
    }
    map['${DatabaseConstants.TEM_C_TEAM_NAME}'] = _name;
    map['${DatabaseConstants.TEM_C_RATING_TYPE_ID}'] = _ratingTypeId;
    map['${DatabaseConstants.TEM_C_PROFILE_PIC}'] = _profilePic;
    map['${DatabaseConstants.TEM_C_FAVORITE}'] = _favorite ? 1 : 0;

    return map;
  }

  Team.fromMap(Map<String, dynamic> map) {
    _id = map['${DatabaseConstants.TEM_C_TEAM_ID}'];
    _name = map['${DatabaseConstants.TEM_C_TEAM_NAME}'];
    _ratingTypeId = map['${DatabaseConstants.TEM_C_RATING_TYPE_ID}'];
    _profilePic = map['${DatabaseConstants.TEM_C_PROFILE_PIC}'];
    _favorite = map['${DatabaseConstants.TEM_C_FAVORITE}'] == 1;
  }
}
