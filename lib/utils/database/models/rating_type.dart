import 'package:goateam/utils/database/models/rating_type_attribute.dart';

class DbRatingType {
  int _id;
  String _name;
  List<DbRatingTypeAttribute> _attributes;

  DbRatingType(this._id, this._name, this._attributes);

  set id(int id) {
    this._id = id;
  }

  int get id => _id;

  set name(String name) {
    this._name = name;
  }

  String get name => _name;

  set attributes(List<DbRatingTypeAttribute> attributes) {
    this._attributes = attributes;
  }

  List<DbRatingTypeAttribute> get attributes => _attributes;
}
