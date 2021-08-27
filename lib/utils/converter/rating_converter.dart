import 'package:goateam/models/rating.dart';

class RatingConverter {
  List<Rating> convert(List<Map<String, dynamic>> result) {
    var ratings = List<Rating>.empty(growable: true);

    result.forEach((ratingMapping) {
      ratings.add(Rating.fromMap(ratingMapping));
    });

    return ratings;
  }
}
