import '../entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String date;
  final String comment;
  final num rating;

  ReviewModel({
    required this.name,
    required this.image,
    required this.date,
    required this.comment,
    required this.rating,
  });

  factory ReviewModel.fromEntity(ReviewEntity review) {
    return ReviewModel(
      name: review.name,
      image: review.image,
      date: review.date,
      comment: review.comment,
      rating: review.rating,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'] as String,
      image: json['image'] as String,
      date: json['date'] as String,
      comment: json['comment'] as String,
      rating: json['rating'] as num,
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      date: date,
      comment: comment,
      rating: rating,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'comment': comment,
      'rating': rating,
    };
  }
}
