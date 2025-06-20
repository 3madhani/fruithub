import 'package:fruithub/core/entities/product_entity.dart';

import '../helper/get_average_rating.dart';
import 'review_model.dart';

class ProductModel {
  final String title;
  final String description;
  final num price;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.averageRating,
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

  factory ProductModel.fromEntity(ProductEntity entity) => ProductModel(
    averageRating: entity.averageRating,
    title: entity.title,
    description: entity.description,
    price: entity.price,
    code: entity.code,
    isFeatured: entity.isFeatured,
    imageUrl: entity.imageUrl,
    expirationMonth: entity.expirationMonth,
    numberOfCalories: entity.numberOfCalories,
    unitAmount: entity.unitAmount,
    isOrganic: entity.isOrganic,
    reviews:
        entity.reviews.map((review) => ReviewModel.fromEntity(review)).toList(),
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    averageRating: getAverageRating(
      json['reviews'] != null
          ? (json['reviews'] as List)
              .map((review) => ReviewModel.fromJson(review))
              .toList()
          : <ReviewModel>[],
    ),
    title: json['title'] as String,
    description: json['description'] as String,
    price: json['price'] as num,
    code: json['code'] as String,
    isFeatured: json['isFeatured'] as bool,
    imageUrl: json['imageUrl'] as String?,
    expirationMonth: json['expirationMonth'] as int,
    numberOfCalories: json['numberOfCalories'] as int,
    unitAmount: json['unitAmount'] as int,
    isOrganic: json['isOrganic'] as bool,
    reviews:
        json['reviews'] != null
            ? (json['reviews'] as List)
                .map((review) => ReviewModel.fromJson(review))
                .toList()
            : <ReviewModel>[],
  );

  ProductEntity toEntity() {
    return ProductEntity(
      // averageRating: averageRating,
      title: title,
      description: description,
      price: price,
      code: code,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expirationMonth: expirationMonth,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      reviews: reviews.map((review) => review.toEntity()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'price': price,
    'code': code,
    'isFeatured': isFeatured,
    'imageUrl': imageUrl,
    'expirationMonth': expirationMonth,
    'numberOfCalories': numberOfCalories,
    'unitAmount': unitAmount,
    'isOrganic': isOrganic,
    'reviews': reviews.map((review) => review.toJson()).toList(),
  };
}
