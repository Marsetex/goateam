import 'package:goateam/utils/converter/rating_converter.dart';
import 'package:sqflite/sqflite.dart';

import 'package:goateam/models/player.dart';
import 'package:goateam/models/rating.dart';
import 'package:goateam/utils/database/constants/database_constants.dart';
import 'package:goateam/utils/database/provider/provider_base.dart';

class RatingProvider extends ProviderBase {
  Future<List<Rating>> getRatingsByPlayer(Player player, [Database db]) async {
    Database dbContext = await setDbContextIfNull(db);

    List<Map<String, dynamic>> result = await dbContext.rawQuery('''
      SELECT  ${DatabaseConstants.RTS_T_NAME}.${DatabaseConstants.RTS_C_RATINGS_ID},
              ${DatabaseConstants.RTS_T_NAME}.${DatabaseConstants.RTS_C_MEMBERSHIP_ID},
              ${DatabaseConstants.RTS_T_NAME}.${DatabaseConstants.RTS_C_RATINGS_TYPE_ATTRIBUTE_ID},
              ${DatabaseConstants.RTS_T_NAME}.${DatabaseConstants.RTS_C_RATING_ATTRIBUTE_VALUE}
      FROM ${DatabaseConstants.RTS_T_NAME}
      WHERE ${DatabaseConstants.RTS_T_NAME}.${DatabaseConstants.RTS_C_MEMBERSHIP_ID} = ${player.membershipId};
    ''');

    return RatingConverter().convert(result);
  }
}
