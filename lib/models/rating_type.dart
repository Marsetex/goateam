import 'package:goateam/models/rating_type_attribute.dart';
import 'package:goateam/utils/database/constants/database_constants.dart';

class RatingType {
  int _id;
  String _name;
  List<RatingTypeAttribute> _attributes;

  RatingType(this._name, this._attributes);

  int get id => _id;

  set name(String name) {
    this._name = name;
  }

  String get name => _name;

  set attributes(List<RatingTypeAttribute> attributes) {
    this._attributes = attributes;
  }

  List<RatingTypeAttribute> get attributes => _attributes;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map[DatabaseConstants.RTY_C_RATING_TYPE_ID] = _id;
    }
    map[DatabaseConstants.RTY_C_RATING_TYPE_NAME] = _name;

    return map;
  }

  RatingType.fromMap(Map<String, dynamic> map) {
    _id = map[DatabaseConstants.RTY_C_RATING_TYPE_ID];
    _name = map[DatabaseConstants.RTY_C_RATING_TYPE_NAME];
    _attributes = <RatingTypeAttribute>[RatingTypeAttribute.fromMap(map)];
  }
}
