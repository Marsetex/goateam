import 'package:sqflite/sqflite.dart';

import 'package:goateam/models/team.dart';
import 'package:goateam/utils/converter/team_converter.dart';
import 'package:goateam/utils/database/constants/database_constants.dart';
import 'package:goateam/utils/database/provider/provider_base.dart';

class TeamProvider extends ProviderBase {
  Future<List<Team>> getTeams([Database db]) async {
    Database dbContext = await setDbContextIfNull(db);

    List<Map<String, dynamic>> result = await dbContext.rawQuery('''
      SELECT  ${DatabaseConstants.TEM_T_NAME}.${DatabaseConstants.TEM_C_TEAM_ID},
              ${DatabaseConstants.TEM_T_NAME}.${DatabaseConstants.TEM_C_TEAM_NAME},
              ${DatabaseConstants.TEM_T_NAME}.${DatabaseConstants.TEM_C_PROFILE_PIC},
              ${DatabaseConstants.TEM_T_NAME}.${DatabaseConstants.TEM_C_FAVORITE},
              ${DatabaseConstants.RTY_T_NAME}.${DatabaseConstants.RTY_C_RATING_TYPE_ID},
              ${DatabaseConstants.RTY_T_NAME}.${DatabaseConstants.RTY_C_RATING_TYPE_NAME}
      FROM ${DatabaseConstants.TEM_T_NAME}
      INNER JOIN ${DatabaseConstants.RTY_T_NAME} on 
        ${DatabaseConstants.RTY_T_NAME}.${DatabaseConstants.RTY_C_RATING_TYPE_ID} = ${DatabaseConstants.TEM_T_NAME}.${DatabaseConstants.TEM_C_RATING_TYPE_ID};
    ''');

    return TeamConverter().convert(result);
  }

  Future<bool> insertTeam(Team team, [Database db]) async {
    Database dbContext = await setDbContextIfNull(db);

    int affectedRows = await dbContext.insert(
        DatabaseConstants.TEM_T_NAME, team.toMap(),
        conflictAlgorithm: ConflictAlgorithm.rollback);

    return affectedRows > 0;
  }

  Future<bool> deleteTeam(Team team, [Database db]) async {
    Database dbContext = await setDbContextIfNull(db);

    int affectedRows = await dbContext.delete(DatabaseConstants.TEM_T_NAME,
        where: '${DatabaseConstants.TEM_C_TEAM_ID} = ?', whereArgs: [team.id]);

    return affectedRows > 0;
  }
}
