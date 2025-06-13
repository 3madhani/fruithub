class ShippingAddressEntity {
  final String name;
  final String phone;
  final String email;
  final String address;
  final String addressDetails;
  final String city;

  ShippingAddressEntity({
    required this.addressDetails,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.city,
  });
}
