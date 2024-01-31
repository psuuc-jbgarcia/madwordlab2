class Product {
  final String productCode;
  String nameDesc;
  double price;
  bool isFavorite;
  int quantity;

  Product({
    required this.productCode,
    required this.nameDesc,
    required this.price,
    this.isFavorite = false,
    this.quantity = 0,
  });
}
