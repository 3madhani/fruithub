import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uId, required super.name, required super.email});

  factory UserModel.fromEntity(UserEntity userEntity) => UserModel(
    uId: userEntity.uId,
    name: userEntity.name,
    email: userEntity.email,
  );

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uId: user.uid,
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(uId: json['uId'], name: json['name'], email: json['email']);

  toMap() {
    return {'uId': uId, 'name': name, 'email': email};
  }
}
