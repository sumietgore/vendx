import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vendx/providers/product.dart';

import 'package:vendx/components/product_card.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late ProductProvider _productProvider;

  @override
  void initState() {
    _productProvider = Provider.of<ProductProvider>(context, listen: false);
    _productProvider.getProductsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    "assets/logo.svg",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "VendX",
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w800),
                )
              ],
            ),
            actions: [
              IconButton.outlined(
                  onPressed: () => {Navigator.pushNamed(context, "/cart")},
                  icon: const Icon(Icons.shopping_cart_outlined)),
              const SizedBox(
                width: 12,
              ),
              IconButton.outlined(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/");
                  },
                  icon: const Icon(Icons.close)),
              const SizedBox(
                width: 12,
              )
            ]),
        body: Material(
          child: Consumer<ProductProvider>(builder: (context, provider, child) {
            if (provider.loading == true) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "Products",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      scrollDirection: Axis.vertical,
                      itemCount: provider.products.length,
                      padding: const EdgeInsets.all(24),
                      itemBuilder: (context, index) {
                        final product = provider.products[index];
                        return ProductCard(
                            productName: product.name,
                            productPrice: product.price.toDouble(),
                            productImage: product.image,
                            productDescription: product.description);
                      },
                    ),
                  ),
                ],
              );
            }
          }),
        ));
  }
}
