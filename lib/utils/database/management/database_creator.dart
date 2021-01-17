import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:goateam/utils/database/constants/database_constants.dart';

class DatabaseCreator {
  void create(Database db, int version) async {
    //await _createTableTeam(db, version);
    //await _createTableTeamMember(db, version);
  }

  Future<void> _createTableTeam(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${DatabaseConstants.TE_T_NAME} (
          ${DatabaseConstants.TE_C_TEAM_ID} INTEGER PRIMARY KEY AUTOINCREMENT, 
          ${DatabaseConstants.TE_C_TEAM_NAME} TEXT,
          ${DatabaseConstants.TE_C_TEAM_PROFILE_PIC} TEXT
        )''');
  }

  Future<void> _createTableTeamMember(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${DatabaseConstants.TE_T_NAME} (
          ${DatabaseConstants.TE_C_TEAM_ID} INTEGER PRIMARY KEY AUTOINCREMENT, 
          ${DatabaseConstants.TE_C_TEAM_NAME} TEXT,
          ${DatabaseConstants.TE_C_TEAM_PROFILE_PIC} TEXT
        )''');
  }
}
