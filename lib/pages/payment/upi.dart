import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendx/providers/shop.dart';
import 'package:http/http.dart' as http;

class UPIPage extends StatelessWidget {
  const UPIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("UPI Payment")),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ShopProvider>(
              builder: (context, shop, child) {
                return const Center(
                  child: Text("Hello"),
                );
              },
            )));
  }
}
