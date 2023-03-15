import 'package:exelon_shopping/widgets/cart_item.dart';
import 'package:exelon_shopping/widgets/cart_total.dart';
import 'package:exelon_shopping/widgets/promo_box.dart';
import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 213, 213, 213),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {},
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
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const CartItem(),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const CartItem(),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            const CartItem(),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            PromoBox(size: size),
            const CartTotal(),
          ],
        ));
  }
}

