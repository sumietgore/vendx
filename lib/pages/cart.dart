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
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Row(
                  children: [
                    OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/payment');
                        },
                        icon: const Icon(Icons.credit_card),
                        label: const Text("Pay with Card")),
                    const SizedBox(
                      width: 24,
                    ),
                    OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/payment');
                        },
                        icon: const Icon(Icons.qr_code),
                        label: const Text("Pay with UPI"))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
