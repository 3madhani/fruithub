class UserEntity {
  final String uId;
  final String name;
  final String email;

  UserEntity({
    required this.uId,
    required this.name,
    required this.email,
  });

  toMap(){
    return {
      'uId': uId,
      'name': name,
      'email': email,
    };
  }
}