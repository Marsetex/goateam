class DbRatingTypeAttribute {
  String _name;

  DbRatingTypeAttribute(this._name);

  String get name => _name;

  set name(String name) {
    this._name = name;
  }
}
