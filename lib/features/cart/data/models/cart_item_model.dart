import 'package:hive/hive.dart';

import '../../../order/data/models/product_model.dart';
part 'cart_item_model.g.dart';

@HiveType(typeId: 0)
class CartItemModel extends HiveObject {
  @HiveField(0)
  final num? subTotal;
  @HiveField(1)
  final num? discountAmount;
  @HiveField(2)
  final num? totalAmount;
  @HiveField(3)
  final num? quantity;
  @HiveField(4)
  final num? rft;
  @HiveField(5)
  final num? weight;
  @HiveField(6)
  final Product? product;
  @HiveField(7)
  final String?orderType;

  CartItemModel(
      {this.subTotal,
      this.product,
      this.rft,
      this.weight,
      this.discountAmount,
      this.totalAmount,
      this.quantity,
      this.orderType,});
}
