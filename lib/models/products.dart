import 'dart:collection';
import 'package:flutter/foundation.dart';

class Products extends ChangeNotifier{
  final List<Product> _products = [];

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);

  int get productCount => _products.length;

  void addProduct(Product product){
    _products.add(product);
    notifyListeners();
  }
}

class Product {
  final String id;
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

  factory Product.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'name': String name,
        'price': int price,
        'image': String image,
        'description': String description
      } =>
        Product(
            id:id, name: name, price: price, image: image, description: description),
      _ => throw const FormatException('Failed to load products.'),
    };
  }
}