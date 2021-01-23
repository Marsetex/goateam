import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:goateam/utils/database/constants/database_constants.dart';

class DatabaseCreator {
  void create(Database db, int version) async {
    await _createTableRatingType(db, version);
    await _createTableRatingTypeAttributes(db, version);
    await _createTableTeam(db, version);
    await _createTablePlayer(db, version);
    await _createTableMembership(db, version);
    await _createTableRatings(db, version);
  }

  Future<void> _createTableRatingType(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${DatabaseConstants.RTY_T_NAME} (
          ${DatabaseConstants.RTY_C_RATING_TYPE_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${DatabaseConstants.RTY_C_RATING_TYPE_NAME} TEXT NOT NULL
        )''');
  }

  Future<void> _createTableRatingTypeAttributes(
      Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${DatabaseConstants.RTA_T_NAME} (
          ${DatabaseConstants.RTA_C_RATING_TYPE_ATTRIBUTES_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${DatabaseConstants.RTA_C_RATING_TYPE_ID} INTEGER NOT NULL,          
          ${DatabaseConstants.RTA_C_ATTRIBUTE_NAME} TEXT NOT NULL,
          FOREIGN KEY(${DatabaseConstants.RTA_C_RATING_TYPE_ID}) REFERENCES ${DatabaseConstants.RTY_T_NAME}(${DatabaseConstants.RTY_C_RATING_TYPE_ID})
        )''');
  }

  Future<void> _createTableTeam(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${DatabaseConstants.TEM_T_NAME} (
          ${DatabaseConstants.TEM_C_TEAM_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${DatabaseConstants.TEM_C_RATING_TYPE_ID} INTEGER NOT NULL,  
          ${DatabaseConstants.TEM_C_TEAM_NAME} TEXT NOT NULL,
          ${DatabaseConstants.TEM_C_PROFILE_PIC} BLOB NOT NULL,
          ${DatabaseConstants.TEM_C_FAVORITE} BOOLEAN NOT NULL CHECK (${DatabaseConstants.TEM_C_FAVORITE} IN (0,1)),
          FOREIGN KEY(${DatabaseConstants.TEM_C_RATING_TYPE_ID}) REFERENCES ${DatabaseConstants.RTY_T_NAME}(${DatabaseConstants.RTY_C_RATING_TYPE_ID})
        )''');
  }

  Future<void> _createTablePlayer(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${DatabaseConstants.PLR_T_NAME} (
          ${DatabaseConstants.PLR_C_PLAYER_ID} INTEGER PRIMARY KEY AUTOINCREMENT, 
          ${DatabaseConstants.PLR_C_PLAYER_NAME} TEXT NOT NULL,
          ${DatabaseConstants.PLR_C_PROFILE_PIC} TEXT NOT NULL
        )''');
  }

  Future<void> _createTableMembership(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${DatabaseConstants.MSP_T_NAME} (
          ${DatabaseConstants.MSP_C_MEMBERSHIP_ID} INTEGER PRIMARY KEY AUTOINCREMENT, 
          ${DatabaseConstants.MSP_C_TEAM_ID} INTEGER NOT NULL,
          ${DatabaseConstants.MSP_C_PLAYER_ID} INTEGER NOT NULL,
          FOREIGN KEY(${DatabaseConstants.MSP_C_TEAM_ID}) REFERENCES ${DatabaseConstants.TEM_T_NAME}(${DatabaseConstants.TEM_C_TEAM_ID}),
          FOREIGN KEY(${DatabaseConstants.MSP_C_PLAYER_ID}) REFERENCES ${DatabaseConstants.PLR_T_NAME}(${DatabaseConstants.PLR_C_PLAYER_ID})
        )''');
  }

  Future<void> _createTableRatings(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${DatabaseConstants.RTS_T_NAME} (
          ${DatabaseConstants.RTS_C_RATINGS_ID} INTEGER PRIMARY KEY AUTOINCREMENT, 
          ${DatabaseConstants.RTS_C_MEMBERSHIP_ID} INTEGER NOT NULL,
          ${DatabaseConstants.RTS_C_RATINGS_TYPE_ATTRIBUTE_ID} INTEGER NOT NULL,
          ${DatabaseConstants.RTS_C_RATING_ATTRIBUTE_VALUE} INTEGER NOT NULL,
          FOREIGN KEY(${DatabaseConstants.RTS_C_MEMBERSHIP_ID}) REFERENCES ${DatabaseConstants.MSP_T_NAME}(${DatabaseConstants.MSP_C_MEMBERSHIP_ID}),
          FOREIGN KEY(${DatabaseConstants.RTS_C_RATINGS_TYPE_ATTRIBUTE_ID}) REFERENCES ${DatabaseConstants.RTA_T_NAME}(${DatabaseConstants.RTA_C_RATING_TYPE_ATTRIBUTES_ID})
        )''');
  }
}
