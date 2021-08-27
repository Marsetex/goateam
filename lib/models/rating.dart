import 'package:goateam/utils/database/constants/database_constants.dart';

class Rating {
  int id;
  int membershipId;
  int ratingTypeAttributeId;
  int ratingAttributeValue;

  Rating(
      this.membershipId, this.ratingTypeAttributeId, this.ratingAttributeValue);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map[DatabaseConstants.RTS_C_RATINGS_ID] = id;
    }
    map[DatabaseConstants.RTS_C_MEMBERSHIP_ID] = membershipId;
    map[DatabaseConstants.RTS_C_RATINGS_TYPE_ATTRIBUTE_ID] =
        ratingTypeAttributeId;
    map[DatabaseConstants.RTS_C_RATING_ATTRIBUTE_VALUE] = ratingAttributeValue;
    return map;
  }

  Rating.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseConstants.RTS_C_RATINGS_ID];
    membershipId = map[DatabaseConstants.RTS_C_MEMBERSHIP_ID];
    ratingTypeAttributeId =
        map[DatabaseConstants.RTS_C_RATINGS_TYPE_ATTRIBUTE_ID];
    ratingAttributeValue = map[DatabaseConstants.RTS_C_RATING_ATTRIBUTE_VALUE];
  }
}
