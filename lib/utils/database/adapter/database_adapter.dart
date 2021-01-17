import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:goateam/utils/database/management/database_creator.dart';

class SqliteDatabaseAdapter {
  static final SqliteDatabaseAdapter adapter =
      SqliteDatabaseAdapter._createInstance();
  static Database _dbContext;

  final int _dbVersion = 1;

  SqliteDatabaseAdapter._createInstance();

  Future<Database> get context async {
    if (_dbContext == null) {
      _dbContext = await initializeDatabase();
    }
    return _dbContext;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'databases/goateam.db';

    return await openDatabase(path,
        version: _dbVersion,
        onCreate: (db, version) => DatabaseCreator().create(db, version));
  }
}
