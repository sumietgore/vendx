import "dart:convert";

import 'package:http/http.dart' as http;
import 'package:vendx/models/product.dart';
import 'package:vendx/pages/store.dart';

class DataService {
  Future<List<Product>> getProducts() async {
    final response =
        await http.get(Uri.parse('https://vendx-backend.fly.dev/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final jsonData = jsonDecode(response.body);
      final List<Product> products = [];

      for (Map<String, dynamic> item in jsonData) {
        Product product = Product.fromJson(item);
        products.add(product);
      }

      return products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to fetch products.');
    }
  }
}
