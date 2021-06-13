import 'package:goateam/utils/database/constants/database_constants.dart';

class Rating {
  int _id;
  int _membershipId;
  int _ratingTypeAttributeId;
  int _ratingAttributeValue;

  Rating(this._membershipId, this._ratingTypeAttributeId,
      this._ratingAttributeValue);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map[DatabaseConstants.RTS_C_RATINGS_ID] = _id;
    }
    map[DatabaseConstants.RTS_C_MEMBERSHIP_ID] = _membershipId;
    map[DatabaseConstants.RTS_C_RATINGS_TYPE_ATTRIBUTE_ID] =
        _ratingTypeAttributeId;
    map[DatabaseConstants.RTS_C_RATING_ATTRIBUTE_VALUE] = _ratingAttributeValue;
    return map;
  }

  Rating.fromMap(Map<String, dynamic> map) {
    _id = map[DatabaseConstants.RTS_C_RATINGS_ID];
    _membershipId = map[DatabaseConstants.RTS_C_MEMBERSHIP_ID];
    _ratingTypeAttributeId =
        map[DatabaseConstants.RTS_C_RATINGS_TYPE_ATTRIBUTE_ID];
    _ratingAttributeValue = map[DatabaseConstants.RTS_C_RATING_ATTRIBUTE_VALUE];
  }
}
