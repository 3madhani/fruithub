import 'package:fruithub/core/models/review_model.dart';

double getAverageRating(List<ReviewModel> reviews) {
  if (reviews.isEmpty) {
    return 0.0; // Return 0 if there are no reviews
  }

  double totalRating = 0.0;
  for (var review in reviews) {
    totalRating += review.rating;
  }

  return totalRating / reviews.length; // Calculate the average rating
}
