import 'package:goateam/utils/database/adapter/goateam_database.dart';

class AppInitializer {
  static Future initialize() async {
    await _registerServices();
    await _loadSettings();
  }

  static Future _registerServices() async {
    // Init database
    await GoateamDatabase.adapter.context;
  }

  static Future _loadSettings() async {
    //TODO load settings
  }
}
