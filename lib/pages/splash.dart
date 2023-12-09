import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Advertisement(width: width),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: FilledButton.icon(
                    
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, "/home");
                    },
                    label: const Text("Start Order"),
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Advertisement extends StatelessWidget {
  const Advertisement({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width,
      child: Center(
          child: Image.asset("assets/advertisement.jpg")),
    );
  }
}
