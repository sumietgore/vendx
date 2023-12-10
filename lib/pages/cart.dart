import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Cart")),
        body: Center(
          child: Column(
            children: [
              const Text("Cart"),
              FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/payment");
                  },
                  child: const Text("Pay"))
            ],
          ),
        ));
  }
}
