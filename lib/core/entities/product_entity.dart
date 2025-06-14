import 'package:equatable/equatable.dart';

import 'review_entity.dart';

class ProductEntity extends Equatable {
  final String title;
  final String description;
  final num price;
  final String code;
  final bool isFeatured;
  final String? imageUrl;
  final int expirationMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating = 0.0;
  final num numberOfReviews = 0;
  final List<ReviewEntity> reviews;

  const ProductEntity({
    required this.reviews,
    this.isOrganic = false,
    required this.title,
    required this.description,
    required this.price,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonth,
    required this.numberOfCalories,
    required this.unitAmount,
  });

  @override
  List<Object?> get props => [code];
}
