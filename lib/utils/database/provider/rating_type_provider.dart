import 'package:sqflite/sqflite.dart';

import 'package:goateam/models/rating_type.dart';
import 'package:goateam/utils/converter/rating_type_converter.dart';
import 'package:goateam/utils/database/constants/database_constants.dart';
import 'package:goateam/utils/database/provider/provider_base.dart';

class RatingTypeProvider extends ProviderBase {
  Future<List<RatingType>> getRatingTypes([Database db]) async {
    Database dbContext = await setDbContextIfNull(db);

    List<Map<String, dynamic>> result = await dbContext.rawQuery('''
      SELECT  ${DatabaseConstants.RTY_T_NAME}.${DatabaseConstants.RTY_C_RATING_TYPE_ID},
              ${DatabaseConstants.RTY_T_NAME}.${DatabaseConstants.RTY_C_RATING_TYPE_NAME},
              ${DatabaseConstants.RTA_T_NAME}.${DatabaseConstants.RTA_C_RATING_TYPE_ID},
              ${DatabaseConstants.RTA_T_NAME}.${DatabaseConstants.RTA_C_RATING_TYPE_ATTRIBUTES_ID},
              ${DatabaseConstants.RTA_T_NAME}.${DatabaseConstants.RTA_C_ATTRIBUTE_NAME}
      FROM ${DatabaseConstants.RTY_T_NAME}
      INNER JOIN ${DatabaseConstants.RTA_T_NAME} on 
        ${DatabaseConstants.RTA_T_NAME}.${DatabaseConstants.RTA_C_RATING_TYPE_ID} = ${DatabaseConstants.RTY_T_NAME}.${DatabaseConstants.RTY_C_RATING_TYPE_ID};
    ''');

    return RatingTypeConverter().convert(result);
  }

  Future<RatingType> getRatingTypeByName(String ratingTypeName,
      [Database db]) async {
    Database dbContext = await setDbContextIfNull(db);

    List<Map<String, dynamic>> result = await dbContext.query(
      DatabaseConstants.RTY_T_NAME,
      where: '${DatabaseConstants.RTY_C_RATING_TYPE_NAME} = ?',
      whereArgs: [ratingTypeName],
      limit: 1,
    );

    return RatingType.fromMap(result[0]);
  }

  Future<void> insertRatingTypes(List<RatingType> ratingTypes,
      [Database db]) async {
    Database dbContext = await setDbContextIfNull(db);

    ratingTypes.forEach((rt) async {
      await dbContext.transaction((txn) async {
        await txn.insert(DatabaseConstants.RTY_T_NAME, rt.toMap(),
            conflictAlgorithm: ConflictAlgorithm.rollback);

        List<Map<String, dynamic>> result = await txn.query(
          DatabaseConstants.RTY_T_NAME,
          where: '${DatabaseConstants.RTY_C_RATING_TYPE_NAME} = ?',
          whereArgs: [rt.name],
          limit: 1,
        );
        Map<String, dynamic> firstResult = result[0];
        var ratingType =
            firstResult['${DatabaseConstants.RTY_C_RATING_TYPE_ID}'];

        rt.attributes.forEach((element) async {
          element.ratingTypeId = ratingType;

          await txn.insert(DatabaseConstants.RTA_T_NAME, element.toMap(),
              conflictAlgorithm: ConflictAlgorithm.rollback);
        });
      });
    });
  }
}
