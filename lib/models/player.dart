import 'dart:typed_data';

import 'package:goateam/models/rating.dart';
import 'package:goateam/utils/database/constants/database_constants.dart';

class Player {
  int id;
  String name;
  Uint8List profilePic;
  int membershipId;
  List<Rating> ratings;

  Player(this.name, this.profilePic, this.membershipId);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['${DatabaseConstants.PLR_C_PLAYER_ID}'] = id;
    }
    map['${DatabaseConstants.PLR_C_PLAYER_NAME}'] = name;
    map['${DatabaseConstants.PLR_C_PROFILE_PIC}'] = profilePic;

    if (membershipId > -1) {
      map['${DatabaseConstants.MSP_C_MEMBERSHIP_ID}'] = membershipId;
    }
    return map;
  }

  Player.fromMap(Map<String, dynamic> map) {
    id = map['${DatabaseConstants.PLR_C_PLAYER_ID}'];
    name = map['${DatabaseConstants.PLR_C_PLAYER_NAME}'];
    profilePic = map['${DatabaseConstants.PLR_C_PROFILE_PIC}'];
    membershipId = map['${DatabaseConstants.MSP_C_MEMBERSHIP_ID}'];
  }
}
