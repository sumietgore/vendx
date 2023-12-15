import "dart:convert";

import 'package:http/http.dart' as http;
import 'package:vendx/models/product.dart';

class DataService {
  Future<List<Product>> getProducts() async {
    final response =
        await http.get(Uri.parse('https://vendx-backend.fly.dev/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final jsonData = jsonDecode(response.body);
      final List<Product> products = [];

      // jsonData.asMap().map((index, value) => print(index + value));

      int currentIndex = 0;

      for (Map<String, dynamic> item in jsonData) {
        Product product = Product.fromJson(item, currentIndex);
        products.add(product);
        currentIndex++;
      }

      return products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to fetch products.');
    }
  }

  Future<String> getQRCode(int total) async {
    try {
      final body = {
        "type": "upi_qr",
        "name": "Store_1",
        "usage": "single_use",
        "fixed_amount": true,
        "payment_amount": total,
        "description": "For Store 1",
        "customer_id": "cust_HKsR5se84c5LTO",
        "close_by": 1681615838,
        "notes": {"purpose": "Test UPI QR Code notes"}
      };
      final headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = await http.post(
          Uri.parse("https://api.razorpay.com/v1/payments/qr_codes"),
          body: body);
      print(response);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('POST request failed: ${response.statusCode}');
      }
    } catch (e) {
      return "Error";
    }
  }
}
