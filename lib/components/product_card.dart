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

  void addToCart(Product product, int qty, BuildContext context) {
    final shop = context.read<ShopProvider>();
    shop.addToCart(product, qty);
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
        showModalSheet(context, setState, _qty);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 0,
            // color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
            color: Colors.grey.shade200,
            shape: const RoundedRectangleBorder(
              // side: BorderSide(
              //   color: Theme.of(context).colorScheme.outlineVariant,
              // ),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                widget.productImage,
                width: 48,
                height: 48,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('₹ ${widget.productPrice.toStringAsFixed(2)}',
                style: GoogleFonts.karla(
                    fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          // const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(widget.productName,
                style: GoogleFonts.karla(
                    fontSize: 12, fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }

  Future<void> showModalSheet(
      BuildContext context, StateSetter setState, int _qty) {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
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
                        IconButton(
                          icon: const Icon(Icons.close, size: 32),
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
                      '₹ ${(widget.productPrice.toInt() * _qty.toInt())}',
                      style: GoogleFonts.karla(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )),
                    Center(
                        child: Text(
                      widget.productName,
                      style: GoogleFonts.karla(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      IconButton.outlined(
                          onPressed: () {
                            setState(() {
                              if (_qty > 1) {
                                _qty -= 1;
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 32,
                          )),
                      SizedBox(
                          width: 36,
                          child: Center(
                              child: Text(
                            '$_qty',
                            style: GoogleFonts.karla(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ))),
                      IconButton.outlined(
                          onPressed: () {
                            setState(() {
                              _qty++;
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 32,
                          ))
                    ]),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FilledButton(
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 24),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0)),
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () =>
                                addToCart(widget.product, _qty, context),
                            child: Text(
                              "Add to Cart",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
