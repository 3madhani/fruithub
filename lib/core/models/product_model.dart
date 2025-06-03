import 'dart:io';

import 'review_model.dart';

class ProductModel {
  final String title;
  final String description;
  final num price;
  final File image;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonth;
  final bool isOrganic;
  final num sellingCount;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating = 0.0;
  final num numberOfReviews = 0;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.sellingCount,
    required this.reviews,
    this.isOrganic = false,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonth,
    required this.numberOfCalories,
    required this.unitAmount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    title: json['title'] as String,
    description: json['description'] as String,
    price: json['price'] as num,
    image: File(json['image'] as String),
    code: json['code'] as String,
    isFeatured: json['isFeatured'] as bool,
    imageUrl: json['imageUrl'] as String?,
    expirationMonth: json['expirationMonth'] as int,
    numberOfCalories: json['numberOfCalories'] as int,
    unitAmount: json['unitAmount'] as int,
    isOrganic: json['isOrganic'] as bool,
    sellingCount: json['sellingCount'] as num,
    reviews: (json['reviews'] as List).map((review) => ReviewModel.fromJson(review)).toList(),
  );

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
