import 'package:fruithub/core/entities/product_entity.dart';

List<ProductEntity> getDummyProducts() {
  final product = ProductEntity(
    title: 'Organic Apple',
    description: 'Fresh organic apples from local farms.',
    price: 12.99,
    code: 'APL123',
    isFeatured: true,
    imageUrl: null,
    expirationMonth: 6,
    isOrganic: true,
    numberOfCalories: 95,
    unitAmount: 6,
    reviews: [],
  );

  // return list of products
  return List.generate(10, (index) => product);
}
