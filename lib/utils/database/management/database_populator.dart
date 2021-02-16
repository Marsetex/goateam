import 'package:goateam/models/rating_type.dart';
import 'package:goateam/utils/database/provider/rating_type_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:goateam/models/rating_type_attribute.dart';

class DatabasePopulator {
  void populate(Database db, int version) async {
    await insertRatingTypes(db, version);
  }

  Future<void> insertRatingTypes(Database db, int version) async {
    RatingType phase3 = RatingType("Phase 3", [
      RatingTypeAttribute("Attack"),
      RatingTypeAttribute("Defense"),
      RatingTypeAttribute("Stamina")
    ]);

    List<RatingType> ratingTypes = [phase3];

    await RatingTypeProvider().insertRatingTypes(db, ratingTypes);
  }
}
