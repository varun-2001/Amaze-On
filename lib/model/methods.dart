import 'dart:convert';

import 'package:exelon_shopping/model/cart.dart';
import 'package:exelon_shopping/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> getProducts() async {
  var url = Uri.parse('http://192.168.0.108:3000/getProducts');

  var response = await http.get(url);
  var json = jsonDecode(response.body);
  List<Product> products = [];
  for (var product in json) {
    products.add(Product.fromJson(product));
  }
  return products;
}

Future<void> addProduct(
    TextEditingController nameController,
    TextEditingController priceController,
    TextEditingController imageUrlController) async {
  // create a map that will hold the data
  Map<String, dynamic> data = {
    "name": nameController.text,
    "price": int.parse(priceController.text),
    "url": imageUrlController.text
  };

  // convert data to JSOn
  String jsonData = jsonEncode(data);
  await http.post(
    Uri.parse("http://192.168.0.108:3000/addProduct"),
    body: jsonData,
    headers: {"Content-Type": "application/json"},
  );
}

Future<void> deleteProduct(String id) async {
  await http.delete(
    Uri.parse("http://192.168.0.108:3000/deleteProduct/$id"),
  );
}

Future<void> updateProduct(
    String id, String name, String price, String url) async {
  Map<String, dynamic> data = {
    "name": name,
    "price": int.parse(price),
    "url": url
  };

  // convert data to JSOn
  String jsonData = jsonEncode(data);
  await http.put(
    Uri.parse("http://192.168.0.108:3000/updateProduct/$id"),
    body: jsonData,
    headers: {"Content-Type": "application/json"},
  );
}


double getCartTotal() {
  double total = 0;
  for (var product in cart.keys) {
    total += product.price * cart[product]!;
  }
  return total;
}