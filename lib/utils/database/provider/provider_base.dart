import 'package:sqflite/sqflite.dart';

import 'package:goateam/utils/database/adapter/goateam_database.dart';

class ProviderBase {
  Future<Database> setDbContextIfNull(Database dbContext) async {
    if (dbContext == null) {
      dbContext = await GoateamDatabase.adapter.context;
    }
    return dbContext;
  }
}
