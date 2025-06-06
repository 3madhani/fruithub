import 'package:fruithub/core/entities/product_entity.dart';

import '../entities/review_entity.dart';

List<ProductEntity> getDummyProducts() {
  final product = ProductEntity(
    title: 'Organic Apple',
    description: 'Fresh organic apples from local farms.',
    price: 12.99,
    code: 'APL123',
    isFeatured: true,
    imageUrl: '',
    expirationMonth: 6,
    isOrganic: true,
    numberOfCalories: 95,
    unitAmount: 6,
    reviews: [
      ReviewEntity(
        name: 'John Doe',
        image: 'https://example.com/user1.jpg',
        date: '2025-06-06',
        comment: 'Great quality product!',
        rating: 4.5,
      ),
      ReviewEntity(
        name: 'Jane Smith',
        image: 'https://example.com/user2.jpg',
        date: '2025-06-05',
        comment: 'Very tasty and fresh.',
        rating: 5.0,
      ),
    ],
  );

  // return list of products
  return List.generate(10, (index) => product);
}
