import '../../feature/account/domain/entities/user_info_entity.dart';

UserInfoEntity getDummyUser() {
  final user = UserInfoEntity(
    name: "John Doe",
    email: "john.doe@example.com",
    imageUrl: "",
    orders: ["order1", "order2", "order3"],
  );

  return user;
}
