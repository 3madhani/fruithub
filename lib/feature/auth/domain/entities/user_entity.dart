class UserEntity {
  final String uId;
  final String name;
  final String email;
  final String? imageUrl;
  final List? orders;
  final List? favourites;

  UserEntity({
    this.favourites,
    this.imageUrl,
    this.orders,
    required this.uId,
    required this.name,
    required this.email,
  });
}
