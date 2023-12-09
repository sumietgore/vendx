import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
          ),
          builder: (BuildContext context) {
            return SizedBox(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CloseButton(
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Center(
                      child: Image.asset(
                        productImage,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                        child: Text(
                      productName,
                      style: GoogleFonts.montserrat(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    )),
                    const SizedBox(
                      height: 4,
                    ),
                    Center(
                        child: Text(
                      productDescription,
                      style: GoogleFonts.openSans(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    )),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      IconButton.outlined(
                          onPressed: () => {}, icon: const Icon(Icons.remove)),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text("1"),
                      const SizedBox(
                        width: 24,
                      ),
                      IconButton.outlined(
                          onPressed: () => {}, icon: const Icon(Icons.add))
                    ]),
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        onPressed: () => {},
                        child: Text("Add to Cart", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(16),
        //   border: Border.all(
        //     color: Colors.grey.shade300,
        //     width: 1,
        //   ),
        //   color: Colors.grey.shade100,
        // ),
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
