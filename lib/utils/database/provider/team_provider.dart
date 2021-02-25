import 'package:sqflite/sqflite.dart';

import 'package:goateam/models/team.dart';
import 'package:goateam/utils/database/constants/database_constants.dart';
import 'package:goateam/utils/database/adapter/goateam_database.dart';

class TeamProvider {
  final _teams = <Team>[
    Team(1, "Team 1", ""),
    Team(2, "Team 2", ""),
    Team(3, "Team 3", ""),
    Team(4, "Team 4", ""),
  ];

  Future<List<Team>> getTeams() async {
    return _teams;

    // Database db = await GoateamDatabase.adapter.context;

    // List<Map<String, dynamic>> result =
    //     await db.query(DatabaseConstants.TEM_T_NAME);

    // List<Team> teams = List<Team>();
    // result.forEach((map) {
    //   teams.add(Team.toList(map));
    // });
    // return teams;
  }

  Future<int> insertTeam(Team team) async {
    Database db = await GoateamDatabase.adapter.context;

    return await db.insert(DatabaseConstants.TEM_T_NAME, team.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort);
  }

  Future<int> deleteTeam(Team team) async {
    var oldLength = _teams.length;
    _teams.removeWhere((t) => t.name == team.name);

    var newLength = _teams.length;
    return oldLength == newLength ? 0 : 1;

    // Database db = await GoateamDatabase.adapter.context;

    // return await db.delete(DatabaseConstants.TEM_T_NAME,
    //     where: '${DatabaseConstants.TEM_C_TEAM_ID} = ?', whereArgs: [team.id]);
  }

  // // Update Operation: Update a todo object and save it to database
  // Future<int> updateTodo(Todo todo) async {
  //   var db = await this.database;
  //   var result = await db.update(todoTable, todo.toMap(),
  //       where: '$colId = ?', whereArgs: [todo.id]);
  //   return result;
  // }

  // // Get number of todo objects in database
  // Future<int> getCount() async {
  //   Database db = await this.database;
  //   List<Map<String, dynamic>> x =
  //       await db.rawQuery('SELECT COUNT (*) from $todoTable');
  //   int result = Sqflite.firstIntValue(x);
  //   return result;
  // }

  // // Get the 'Map List' [ List<Map> ] and convert it to 'todo List' [ List<Todo> ]
  // Future<List<Todo>> getTodoList() async {
  //   var todoMapList = await getTodoMapList(); // Get 'Map List' from database
  //   int count =
  //       todoMapList.length; // Count the number of map entries in db table

  //   List<Todo> todoList = List<Todo>();
  //   // For loop to create a 'todo List' from a 'Map List'
  //   for (int i = 0; i < count; i++) {
  //     todoList.add(Todo.fromMapObject(todoMapList[i]));
  //   }

  //   return todoList;
  // }
}
