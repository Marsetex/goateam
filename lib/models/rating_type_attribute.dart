import 'package:goateam/utils/database/constants/database_constants.dart';

class RatingTypeAttribute {
  int _id;
  int _ratingTypeId;
  String _name;

  RatingTypeAttribute(this._ratingTypeId, this._name);

  int get id => _id;

  int get ratingTypeId => _ratingTypeId;

  set ratingTypeId(int ratingTypeId) {
    this._ratingTypeId = ratingTypeId;
  }

  String get name => _name;

  set name(String name) {
    this._name = name;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map[DatabaseConstants.RTA_C_RATING_TYPE_ATTRIBUTES_ID] = _id;
    }
    map[DatabaseConstants.RTA_C_RATING_TYPE_ID] = _ratingTypeId;
    map[DatabaseConstants.RTA_C_ATTRIBUTE_NAME] = _name;

    return map;
  }

  RatingTypeAttribute.fromMapObject(Map<String, dynamic> map) {
    _id = map[DatabaseConstants.RTA_C_RATING_TYPE_ATTRIBUTES_ID];
    _ratingTypeId = map[DatabaseConstants.RTA_C_RATING_TYPE_ID];
    _name = map[DatabaseConstants.RTA_C_ATTRIBUTE_NAME];
  }
}
