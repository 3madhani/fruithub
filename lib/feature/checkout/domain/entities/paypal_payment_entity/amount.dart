import '../../../../../core/helper/get_currency_funcion.dart';
import '../order_input_entity.dart';
import 'details.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromOrderEntity(OrderInputEntity orderEntity) => Amount(
    total: orderEntity.calculateTotalPrice().toString(),
    currency: getCurrency(),
    details: Details.fromOrderEntity(orderEntity),
  );

  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };
}
