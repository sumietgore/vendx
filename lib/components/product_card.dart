import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String productImage;
  final String productDescription;

  const ProductCard(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.productDescription});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          shape: const RoundedRectangleBorder(
            // <-- SEE HERE
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          builder: (BuildContext context) {
            return SizedBox(
              height: 240,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          child: const Text('X'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Modal BottomSheet'),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Card(
        color: Colors.grey.shade100,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          //set border radius more than 50% of height and width to make circle
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              productImage,
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 10),
            Text(
              productName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '₹ ${productPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}