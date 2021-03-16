import 'package:goateam/models/rating_type.dart';

class RatingTypeConverter {
  List<RatingType> convert(List<Map<String, dynamic>> result) {
    var ratingTypes = Map<int, RatingType>();

    result.forEach((rtMapping) {
      var rt = RatingType.fromMap(rtMapping);

      if (ratingTypes.containsKey(rt.id)) {
        ratingTypes[rt.id].attributes.add(rt.attributes.first);
      } else {
        ratingTypes.addAll({rt.id: rt});
      }
    });

    return ratingTypes.values.toList();
  }
}
