import 'package:sqflite/sqflite.dart';

import 'package:goateam/models/membership.dart';
import 'package:goateam/models/player.dart';
import 'package:goateam/models/rating.dart';
import 'package:goateam/models/team.dart';
import 'package:goateam/utils/converter/player_converter.dart';
import 'package:goateam/utils/database/constants/database_constants.dart';
import 'package:goateam/utils/database/provider/provider_base.dart';
import 'package:goateam/utils/database/provider/rating_provider.dart';

class PlayerProvider extends ProviderBase {
  Future<List<Player>> getPlayersOfTeam(Team team, [Database db]) async {
    Database dbContext = await setDbContextIfNull(db);

    List<Map<String, dynamic>> result = await dbContext.rawQuery('''
      SELECT  ${DatabaseConstants.PLR_T_NAME}.${DatabaseConstants.PLR_C_PLAYER_ID},
              ${DatabaseConstants.PLR_T_NAME}.${DatabaseConstants.PLR_C_PLAYER_NAME},
              ${DatabaseConstants.PLR_T_NAME}.${DatabaseConstants.PLR_C_PROFILE_PIC},
              ${DatabaseConstants.MSP_T_NAME}.${DatabaseConstants.MSP_C_MEMBERSHIP_ID}
      FROM ${DatabaseConstants.PLR_T_NAME}
      INNER JOIN ${DatabaseConstants.MSP_T_NAME} on 
        ${DatabaseConstants.MSP_T_NAME}.${DatabaseConstants.MSP_C_PLAYER_ID} = ${DatabaseConstants.PLR_T_NAME}.${DatabaseConstants.PLR_C_PLAYER_ID}
      WHERE ${DatabaseConstants.MSP_T_NAME}.${DatabaseConstants.MSP_C_TEAM_ID} = ${team.id};
    ''');

    List<Player> players = PlayerConverter().convert(result);

    players.forEach((player) async {
      player.ratings =
          await RatingProvider().getRatingsByPlayer(player, dbContext);
    });

    return players;
  }

  Future<bool> insertPlayer(Player player, Team team, Map<int, int> ratingsMap,
      [Database db]) async {
    Database dbContext = await setDbContextIfNull(db);

    return await dbContext.transaction((txn) async {
      int playerId = await txn.insert(
          DatabaseConstants.PLR_T_NAME, player.toMap(),
          conflictAlgorithm: ConflictAlgorithm.rollback);

      if (playerId < 1) {
        return false;
      }

      var membership = new Memebership(team.id, playerId);
      int membershipId = await txn.insert(
          DatabaseConstants.MSP_T_NAME, membership.toMap(),
          conflictAlgorithm: ConflictAlgorithm.rollback);

      if (membershipId < 1) {
        return false;
      }

      ratingsMap.forEach((key, value) {
        var playerRating = new Rating(membershipId, key, value);
        txn.insert(DatabaseConstants.RTS_T_NAME, playerRating.toMap(),
            conflictAlgorithm: ConflictAlgorithm.rollback);
      });

      return true;
    });
  }
}
