import '../../domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phone;
  String? email;
  String? floor;
  String? address;
  String? city;

  ShippingAddressModel({
    this.floor,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.city,
  });

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) =>
      ShippingAddressModel(
        floor: entity.floor,
        name: entity.name,
        phone: entity.phone,
        email: entity.email,
        address: entity.address,
        city: entity.city,
      );

  String getAddress() => '$address, $floor, $city';

  toJson() => {
    'floor': floor,
    'name': name,
    'phone': phone,
    'email': email,
    'address': address,
    'city': city,
  };
}
