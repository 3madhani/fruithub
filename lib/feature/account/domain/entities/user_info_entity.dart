class UserInfoEntity {
  final String name;
  final String email;
  final String? imageUrl;
  final List<String> orders;
  final List<String> favourites;

  UserInfoEntity({
    required this.favourites,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.orders,
  });

  toJson() => {'name': name, 'email': email, 'imageUrl': imageUrl};
}
