class DatabaseConstants {
  // Constants for table 'rating_type'
  static const String RTY_T_NAME = "rating_type";
  static const String RTY_C_RATING_TYPE_ID = "rating_type_id";
  static const String RTY_C_RATING_TYPE_NAME = "rating_type_name";

  // Constants for table 'rating_type_attributes'
  static const String RTA_T_NAME = "rating_type_attributes";
  static const String RTA_C_RATING_TYPE_ATTRIBUTES_ID =
      "rating_type_attributes_id";
  static const String RTA_C_RATING_TYPE_ID = "rating_type_id";
  static const String RTA_C_ATTRIBUTE_NAME = "attribute_name";

  // Constants for table 'team'
  static const String TEM_T_NAME = "team";
  static const String TEM_C_TEAM_ID = "team_id";
  static const String TEM_C_RATING_TYPE_ID = "rating_type_id";
  static const String TEM_C_TEAM_NAME = "team_name";
  static const String TEM_C_PROFILE_PIC = "profile_pic";
  static const String TEM_C_FAVORITE = "favorite";

  // Constants for table 'player'
  static const String PLR_T_NAME = "player";
  static const String PLR_C_PLAYER_ID = "player_id";
  static const String PLR_C_PLAYER_NAME = "player_name";
  static const String PLR_C_PROFILE_PIC = "profile_pic";

  // Constants for table 'membership'
  static const String MSP_T_NAME = "membership";
  static const String MSP_C_MEMBERSHIP_ID = "membership_id";
  static const String MSP_C_TEAM_ID = "team_id";
  static const String MSP_C_PLAYER_ID = "player_id";

  // Constants for table 'ratings'
  static const String RTS_T_NAME = "ratings";
  static const String RTS_C_RATINGS_ID = "ratings_id";
  static const String RTS_C_MEMBERSHIP_ID = "membership_id";
  static const String RTS_C_RATINGS_TYPE_ATTRIBUTE_ID =
      "rating_type_attributes_id";
  static const String RTS_C_RATING_ATTRIBUTE_VALUE = "rating_attribute_value";
}
