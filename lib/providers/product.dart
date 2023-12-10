 	import 'package:flutter/material.dart';
import 'package:vendx/services/product.dart';

import 'package:vendx/models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  bool loading = false;
  DataService services = DataService();

  List<Product> get products => _products;

  getProductsData() async {
    loading = true;
    _products = (await services.getProducts()).cast<Product>();
    loading = false;

    notifyListeners();
  }
}
