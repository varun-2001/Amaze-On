import 'package:exelon_shopping/model/methods.dart';
import 'package:exelon_shopping/pages/add_product.dart';
import 'package:exelon_shopping/pages/product_cart.dart';
import 'package:exelon_shopping/widgets/product_card.dart';
import 'package:exelon_shopping/widgets/product_info.dart';
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductCart(),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black45,
              ),
            ),
          ),
        ],
      ),
      // create a body that has a scrollable gridview that builds a list of product cards using data.dart
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                // create dialog box to add data
                DialogRoute(
                  context: context,
                  builder: (BuildContext context) => const AddProduct(),
                ),
              )
              .then(
                (value) => setState(() {}),
              );
        },
        backgroundColor: Colors.green[200],
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: getProducts(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GridView.count(
                childAspectRatio: 10 / 16,
                crossAxisCount: 2,
                children: List.generate(
                  snapshot.data.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductInfo(
                              product: snapshot.data[index],
                            ),
                          ),
                        ).then((value) => setState(() {}));
                      },
                      child: ProductCard(
                        product: snapshot.data[index],
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
