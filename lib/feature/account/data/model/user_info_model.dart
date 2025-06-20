import '../../domain/entities/user_info_entity.dart';
import 'favourite_model.dart';

class UserInfoModel {
  final String name;
  final String email;
  final String? imageUrl;
  final List<String> orders;
  final List<FavouriteModel> favourites;

  UserInfoModel({
    required this.favourites,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.orders,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    favourites:
        (json['favourites'] as List?)
            ?.map((e) => FavouriteModel.fromJson(e))
            .toList() ??
        [],
    name: json['name'] as String,
    email: json['email'] as String,
    imageUrl: json['imageUrl'],
    orders: List<String>.from(json['orders'] ?? []),
  );

  UserInfoEntity toEntity() => UserInfoEntity(
    favourites: favourites.map((e) => e.toEntity()).toList(),
    name: name,
    email: email,
    imageUrl: imageUrl,
    orders: orders,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'imageUrl': imageUrl,
    'orders': orders,
    'favourites': favourites.map((e) => e.toJson()).toList(),
  };
}
