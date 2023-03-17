class Product {
  String id;
  String name;
  String imageUrl;
  double price;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      imageUrl: json['url'],
      price: json['price'].toDouble(),
    );
  }
}
