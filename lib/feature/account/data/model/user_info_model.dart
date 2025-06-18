import '../../domain/entities/user_info_entity.dart';

class UserInfoModel {
  final String name;
  final String email;
  final String? imageUrl;
  final List<String> orders;

  UserInfoModel({
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.orders,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    name: json['name'] as String,
    email: json['email'] as String,
    imageUrl: json['imageUrl'] as String,
    orders: json['orders'] as List<String>,
  );

  toEntity() => UserInfoEntity(
    name: name,
    email: email,
    imageUrl: imageUrl,
    orders: orders,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'imageUrl': imageUrl,
  };
}
