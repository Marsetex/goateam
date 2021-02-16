import 'package:sqflite/sqflite.dart';

import 'package:goateam/models/rating_type.dart';
import 'package:goateam/utils/database/models/rating_type.dart';
import 'package:goateam/utils/database/constants/database_constants.dart';
import 'package:goateam/utils/database/adapter/goateam_database.dart';

class RatingTypeProvider {
  final _teams = <RatingType>[
    RatingType("Rating 1", null),
    RatingType("Rating 2", null),
    RatingType("Rating 3", null),
    RatingType("Rating 4", null)
  ];

  Future<List<RatingType>> getRatingTypes() async {
    return _teams;

    Database db = await GoateamDatabase.adapter.context;

    List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT  ${DatabaseConstants.RTY_T_NAME}.${DatabaseConstants.RTY_C_RATING_TYPE_ID},
              ${DatabaseConstants.RTY_T_NAME}.${DatabaseConstants.RTY_C_RATING_TYPE_NAME},
              ${DatabaseConstants.RTA_T_NAME}.${DatabaseConstants.RTA_C_RATING_TYPE_ATTRIBUTES_ID},
              ${DatabaseConstants.RTA_T_NAME}.${DatabaseConstants.RTA_C_ATTRIBUTE_NAME}
      FROM ${DatabaseConstants.RTY_T_NAME}
      INNER JOIN ${DatabaseConstants.RTA_T_NAME} on 
        ${DatabaseConstants.RTA_T_NAME}.${DatabaseConstants.RTA_C_RATING_TYPE_ID} = ${DatabaseConstants.RTY_T_NAME}.${DatabaseConstants.RTY_C_RATING_TYPE_ID};
    ''');

    // await db.query(DatabaseConstants.RTY_T_NAME);

    // List<Team> teams = List<Team>();
    // result.forEach((map) {
    //   teams.add(Team.toList(map));
    // });
    return null;
  }

  Future<void> insertRatingTypes(
      Database db, List<RatingType> ratingTypes) async {
    ratingTypes.forEach((rt) async {
      await db.transaction((txn) async {
        await txn.rawInsert('''
          INSERT INTO ${DatabaseConstants.RTY_T_NAME} (${DatabaseConstants.RTY_C_RATING_TYPE_NAME})
          VALUES ('${rt.name}')
        ''');

        List<Map<String, dynamic>> result = await txn.query(
            DatabaseConstants.RTY_T_NAME,
            where: '${DatabaseConstants.RTY_C_RATING_TYPE_NAME} = ?',
            whereArgs: [rt.name],
            limit: 1);
        Map<String, dynamic> kok = result[0];
        var k = kok['${DatabaseConstants.RTY_C_RATING_TYPE_ID}'];

        rt.attributes.forEach((element) async {
          await txn.rawInsert('''
            INSERT INTO ${DatabaseConstants.RTA_T_NAME} (${DatabaseConstants.RTA_C_RATING_TYPE_ID}, ${DatabaseConstants.RTA_C_ATTRIBUTE_NAME})
            VALUES ($k, '${element.name}')
          ''');
        });
      });
    });
  }
}
