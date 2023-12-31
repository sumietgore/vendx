class Product {
  //TODO: Add ID to product model
  final int id;
  final String name;
  final int price;
  final String image;
  final String description;

  const Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> json, int id) {
    return switch (json) {
      {
        'name': String name,
        'price': int price,
        'image': String image,
        'description': String description
      } =>
        Product(
            id: id,
            name: name,
            price: price,
            image: image,
            description: description),
      _ => throw const FormatException('Failed to load products.'),
    };
  }
}
