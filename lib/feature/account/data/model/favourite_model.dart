import '../../../../core/models/product_model.dart';
import '../../domain/entities/favourite_entity.dart';

class FavouriteModel {
  final String productCode;
  final ProductModel product;

  FavouriteModel({required this.productCode, required this.product});

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    final productCode = json.keys.first;
    final productJson = json[productCode] as Map<String, dynamic>;
    return FavouriteModel(
      productCode: productCode,
      product: ProductModel.fromJson(productJson),
    );
  }

  FavouriteEntity toEntity() =>
      FavouriteEntity(code: productCode, productEntity: product.toEntity());

  Map<String, dynamic> toJson() => {productCode: product.toJson()};
}
