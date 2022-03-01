class Product {
  final int productId;
  final String name;
  final int price;
  final String? image;
  final double quantity;

  Product({required this.productId, required this.name, required this.price, this.image, required this.quantity});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
      name: json['name'],
    );
  }
}