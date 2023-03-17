// ignore_for_file: avoid_unnecessary_containers
// ignore_for_file: prefer_const_constructors

import 'package:exelon_shopping/model/cart.dart';
import 'package:exelon_shopping/model/methods.dart';
import 'package:exelon_shopping/widgets/increment_counter.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../pages/product_cart.dart';

class ProductInfo extends StatefulWidget {
  // final String id;
  // final String name;
  // final double price;
  // final String imageUrl;
  final Product product;

  const ProductInfo({
    Key? key,
    // required this.id,
    // required this.name,
    // required this.price,
    // required this.imageUrl,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {

  int _counterValue = 0;

  void _onCounterValueChanged(int counterValue) {
    setState(() {
      _counterValue = counterValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductCart(),
                  ),
                );
              },
            ),
          ],
        ),
        backgroundColor: Colors.grey[300],
        body: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: size.height * 0.65,
                    child: Image.network(widget.product.imageUrl),
                  ),
                  DeleteButton(widget: widget),
                  EditButton()
                ],
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 35.0, top: 40.0, right: 35.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.product.name,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              child: Row(children: const [
                                Icon(Icons.star, color: Colors.black),
                                Icon(Icons.star, color: Colors.black),
                                Icon(Icons.star, color: Colors.black),
                                Icon(Icons.star, color: Colors.black),
                                Icon(Icons.star_half, color: Colors.black),
                              ]),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Text('Lorem ipsum dolor'),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${widget.product.price}",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),


                            CounterWidget(
                              initialValue: 0,
                              onCounterValueChanged: _onCounterValueChanged,
                            ),
                            TextButton(
                              onPressed: () => {
                                cart[widget.product] = _counterValue
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.black,
                                ),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Cart",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
            icon: Icon(Icons.edit),
            // onpressed should remove the product from the cart
            onPressed: () {}),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.widget,
  });

  final ProductInfo widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 10,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.red.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
            icon: Icon(Icons.delete_outline),
            // onpressed should remove the product from the cart
            onPressed: () {
              deleteProduct(widget.product.id);
              Navigator.pop(context);
            }),
      ),
    );
  }
}
