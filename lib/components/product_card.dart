import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vendx/models/product.dart';
import 'package:vendx/providers/shop.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final String productName;
  final double productPrice;
  final String productImage;
  final String productDescription;

  const ProductCard(
      {super.key,
      required this.product,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.productDescription});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int _qty = 1;

  void addToCart(Product product, BuildContext context) {
    final shop = context.read<ShopProvider>();
    shop.addToCart(product, 1);
    Navigator.pop(context);
  }

  void _incrementCounter() {
    setState(() {
      _qty++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_qty > 0) {
        _qty--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(product);
    return GestureDetector(
      onTap: () {
        showModalSheet(context, _qty);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.productImage,
              width: 48,
              height: 48,
            ),
            const SizedBox(height: 10),
            Text(
              widget.productName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              '₹ ${widget.productPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            // Center(
            //   child: Row(
            //     children: [
            //       IconButton.outlined(
            //           onPressed: _decrementCounter,
            //           icon: const Icon(Icons.remove)),
            //       const SizedBox(
            //         width: 24,
            //       ),
            //       Text('$_qty'),
            //       const SizedBox(
            //         width: 24,
            //       ),
            //       IconButton.outlined(
            //           onPressed: _incrementCounter, icon: const Icon(Icons.add))
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Future<void> showModalSheet(BuildContext context, int _qty) {
    return showModalBottomSheet<void>(
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
                    widget.productImage,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Center(
                    child: Text(
                  widget.productName,
                  style: GoogleFonts.montserrat(
                      fontSize: 24, fontWeight: FontWeight.w500),
                )),
                const SizedBox(
                  height: 4,
                ),
                Center(
                    child: Text(
                  widget.productDescription,
                  style: GoogleFonts.openSans(
                      fontSize: 16, fontWeight: FontWeight.normal),
                )),
                const SizedBox(
                  height: 32,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  IconButton.outlined(
                      onPressed: () {
                        setState(() {
                          _qty -= 1;
                        });
                      },
                      icon: const Icon(Icons.remove)),
                  const SizedBox(
                    width: 24,
                  ),
                  Text('$_qty'),
                  const SizedBox(
                    width: 24,
                  ),
                  IconButton.outlined(
                      onPressed: _incrementCounter, icon: const Icon(Icons.add))
                ]),
                const SizedBox(
                  height: 32,
                ),
                Center(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    onPressed: () => addToCart(widget.product, context),
                    child: Text(
                      "Add to Cart",
                      style: GoogleFonts.montserrat(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
