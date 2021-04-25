import 'package:goateam/models/player.dart';
import 'package:goateam/utils/database/provider/provider_base.dart';

class PlayerProvider extends ProviderBase {
  Future<List<Player>> getPlayers() async {
    return <Player>[
      Player('Name 1', null),
      Player('Name 2', null),
      Player('Name 3', null),
      Player('Name 4', null),
      Player('Name 5', null),
      Player('Name 6', null),
      Player('Name 7', null),
      Player('Name 8', null),
      Player('Name 9', null),
      Player('Name 10', null),
      Player('Name 11', null),
      Player('Name 12', null),
      Player('Name 13', null),
      Player('Name 14', null),
    ];
  }
}
