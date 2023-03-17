// create a cart model with price, name, id, quantity

import 'package:exelon_shopping/model/product_model.dart';

class CartItems {
  // create a cart model with product model and quantity
  final Product product;
  final int quantity;

  CartItems({
    required this.product,
    required this.quantity,
  });
}


