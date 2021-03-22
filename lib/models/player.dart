import 'dart:typed_data';

import 'package:goateam/utils/database/constants/database_constants.dart';

class Player {
  int _id;
  String _name;
  Uint8List _profilePic;

  Player(this._name, this._profilePic);

  int get id => _id;

  String get name => _name;

  set name(String name) {
    this._name = name;
  }

  Uint8List get profilePic => _profilePic;

  set profilePic(Uint8List profilePic) {
    this._profilePic = profilePic;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['${DatabaseConstants.PLR_C_PLAYER_ID}'] = _id;
    }
    map['${DatabaseConstants.PLR_C_PLAYER_NAME}'] = _name;
    map['${DatabaseConstants.PLR_C_PROFILE_PIC}'] = _profilePic;

    return map;
  }

  Player.fromMap(Map<String, dynamic> map) {
    _id = map['${DatabaseConstants.PLR_C_PLAYER_ID}'];
    _name = map['${DatabaseConstants.PLR_C_PLAYER_NAME}'];
    _profilePic = map['${DatabaseConstants.PLR_C_PROFILE_PIC}'];
  }
}
