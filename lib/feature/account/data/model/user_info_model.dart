import '../../domain/entities/user_info_entity.dart';

class UserInfoModel {
  final String name;
  final String email;
  final String? imageUrl;
  final List<String> orders;
  final List<String> favourites;

  UserInfoModel({
    required this.favourites,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.orders,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    favourites: List<String>.from(
      json['favourites']?.map((e) => e as String) ?? [],
    ),
    name: json['name'] as String,
    email: json['email'] as String,
    imageUrl: json['imageUrl'],
    orders: List<String>.from(json['orders'] ?? []),
  );

  UserInfoEntity toEntity() => UserInfoEntity(
    favourites: favourites.map((e) => e).toList(),
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
    'favourites': favourites,
  };
}
