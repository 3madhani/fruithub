
import '../entities/review_entity.dart';

double getAverageRating(List<ReviewEntity> reviews) {
  if (reviews.isEmpty) {
    return 0.0; // Return 0 if there are no reviews
  }

  double totalRating = 0.0;
  for (var review in reviews) {
    totalRating += review.rating;
  }

  return totalRating / reviews.length; // Calculate the average rating
}
