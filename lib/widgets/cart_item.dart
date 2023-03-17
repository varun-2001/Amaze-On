import 'package:exelon_shopping/widgets/increment_counter.dart';
import 'package:flutter/material.dart';

import '../model/cart.dart';
import '../model/product_model.dart';

class CartItem extends StatefulWidget {
  // add Product and quantity parameter
  final Product product;
  final int quantity;
  
  // const CartItem({super.key});
  const CartItem({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
   int _counterValue = 0;

  void _onCounterValueChanged(int counterValue) {
    setState(() {
      _counterValue = counterValue;
      cart[widget.product] = _counterValue; // update the quantity of product
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(20),
      height: size.height / 6,
      decoration: BoxDecoration(
        // color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              widget.product.imageUrl,
              height: size.height / 6,
              width: size.width / 4,
              fit: BoxFit.cover
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Lorem ipsum dolor',
                  style: TextStyle(
                    fontSize: 12,
                  )),
              const SizedBox(height: 10),
              Text(
                '\$${widget.product.price}',
                style: const TextStyle(
                  fontSize: 20,
                  
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          CounterWidget(
            initialValue: widget.quantity,
            onCounterValueChanged: _onCounterValueChanged,
          ),
        ],
      ),
    );
  }
}
