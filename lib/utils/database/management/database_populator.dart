import 'package:sqflite/sqflite.dart';

import 'package:goateam/models/rating_type.dart';
import 'package:goateam/models/rating_type_attribute.dart';
import 'package:goateam/utils/database/provider/rating_type_provider.dart';

class DatabasePopulator {
  final List<RatingType> defaultRatingTypes = <RatingType>[
    RatingType("No rating",
        <RatingTypeAttribute>[RatingTypeAttribute(-1, "NoRatingValue")]),
    RatingType("Simple rating",
        <RatingTypeAttribute>[RatingTypeAttribute(-1, "SimpleRatingValue")]),
    RatingType("Advanced rating", <RatingTypeAttribute>[
      RatingTypeAttribute(-1, "Attack"),
      RatingTypeAttribute(-1, "Defense"),
      RatingTypeAttribute(-1, "Stamina")
    ]),
  ];

  void populate(Database db, int version) async {
    await insertRatingTypes(db, version);
  }

  Future<void> insertRatingTypes(Database db, int version) async {
    await RatingTypeProvider().insertRatingTypes(defaultRatingTypes, db);
  }
}
