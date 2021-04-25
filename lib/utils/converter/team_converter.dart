import 'package:goateam/models/team.dart';

class TeamConverter {
  List<Team> convert(List<Map<String, dynamic>> result) {
    var teams = Map<int, Team>();

    result.forEach((teamMapping) {
      var team = Team.fromMap(teamMapping);

      if (teams.containsKey(team.id)) {
        teams[team.id].ratingType = team.ratingType;
      } else {
        teams.addAll({team.id: team});
      }
    });

    return teams.values.toList();
  }
}
