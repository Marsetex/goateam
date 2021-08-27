import 'package:goateam/models/player.dart';

class PlayerConverter {
  List<Player> convert(List<Map<String, dynamic>> result) {
    var players = List<Player>.empty(growable: true);

    result.forEach((playerMapping) {
      var player = Player.fromMap(playerMapping);
      players.add(player);
    });

    return players;
  }
}
