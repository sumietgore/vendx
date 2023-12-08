import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print(width);
    print(height);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: width,
                height: height * 3 / 4,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: const Center(
                    child: Text(
                  "Advertisement",
                  style: TextStyle(color: Colors.black),
                )),
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.all(32),
                child: SizedBox(
                  width: width * 3 / 4,
                  height: 48,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(width: 0.5, color: Colors.grey),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, "/home");
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Start Order"),
                      ],
                    ),
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
