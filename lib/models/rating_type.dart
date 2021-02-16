import 'package:goateam/models/rating_type_attribute.dart';

class RatingType {
  String _name;
  List<RatingTypeAttribute> _attributes;

  RatingType(this._name, this._attributes);

  String get name => _name;

  List<RatingTypeAttribute> get attributes => _attributes;

  set name(String name) {
    this._name = name;
  }

  set attributes(List<RatingTypeAttribute> attributes) {
    this._attributes.addAll(attributes);
  }
}
