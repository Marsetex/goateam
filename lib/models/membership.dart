import 'package:goateam/utils/database/constants/database_constants.dart';

class Memebership {
  int _id;
  int _teamId;
  int _playerId;

  Memebership(this._teamId, this._playerId);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['${DatabaseConstants.MSP_C_MEMBERSHIP_ID}'] = _id;
    }
    map['${DatabaseConstants.MSP_C_TEAM_ID}'] = _teamId;
    map['${DatabaseConstants.MSP_C_PLAYER_ID}'] = _playerId;

    return map;
  }

  Memebership.fromMap(Map<String, dynamic> map) {
    _id = map['${DatabaseConstants.MSP_C_MEMBERSHIP_ID}'];
    _teamId = map['${DatabaseConstants.MSP_C_TEAM_ID}'];
    _playerId = map['${DatabaseConstants.MSP_C_PLAYER_ID}'];
  }
}
