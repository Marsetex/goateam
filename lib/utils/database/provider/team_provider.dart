import 'package:sqflite/sqflite.dart';

import 'package:goateam/models/team.dart';
import 'package:goateam/utils/database/constants/database_constants.dart';
import 'package:goateam/utils/database/provider/provider_base.dart';

class TeamProvider extends ProviderBase {
  Future<List<Team>> getTeams([Database db]) async {
    Database dbContext = await setDbContextIfNull(db);

    List<Map<String, dynamic>> records =
        await dbContext.query(DatabaseConstants.TEM_T_NAME);

    var teams = <Team>[];
    records.forEach((mapping) {
      teams.add(Team.fromMap(mapping));
    });

    return teams;
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
