import 'package:exelon_shopping/widgets/product_card_new.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        title: const Center(
          child: Text(
            "Search Product",
            style: TextStyle(color: Colors.black45),
          ),
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.black45,
            ),
          ),
        ],
      ),
      // create a body that has a scrollable gridview that builds a list of product cards using data.dart
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 10 /
            16, //this is by trial and error. by default it is 1. so i changed it to 10/16. i recommend you to play around with this value or use the staggered gridview package as it dynamically adjusts the height of the card for you
        children: List.generate(2, (index) {
          return const ProductCard();
        }),
      ),
      // body: Center(child: ProductCard()),
    );
  }
}
