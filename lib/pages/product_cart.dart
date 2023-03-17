import 'package:exelon_shopping/widgets/cart_item.dart';
import 'package:exelon_shopping/widgets/cart_total.dart';
import 'package:exelon_shopping/widgets/promo_box.dart';
import 'package:flutter/material.dart';

import '../model/cart.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 213, 213),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Shopping Bag',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
              onPressed: () {
                // print value of cart
                for (var item in cart.entries) {
                  print('${item.key.name} : ${item.value}');
                }
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              CartItem(
                product: cart.keys.elementAt(index),
                quantity: cart.values.elementAt(index),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PromoBox(size: size),
          CartTotal(),
        ],
      ),
    );
  }
}
