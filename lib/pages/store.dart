import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vendx/providers/shop.dart';

import 'package:vendx/components/product_card.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late ShopProvider _productProvider;

  @override
  void initState() {
    _productProvider = Provider.of<ShopProvider>(context, listen: false);
    _productProvider.getProductsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        //   child: IconButton.filled(
        //       style: FilledButton.styleFrom(
        //         backgroundColor: Colors.black,
        //         foregroundColor: Colors.grey.shade100,
        //       ),
        //       onPressed: () {
        //         Navigator.pushNamed(context, "/cart");
        //       },
        //       icon: const SizedBox(
        //         height: 40,
        //         width: 40,
        //         child: Icon(
        //           Icons.shopping_cart_outlined,
        //           size: 32,
        //         ),
        //       )),
        // ),
        appBar: AppBar(
            toolbarHeight: 80,
            title: Row(
              children: [
                SizedBox(
                  width: 32,
                  height: 32,
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
                      fontSize: 24, fontWeight: FontWeight.w800),
                )
              ],
            ),
            actions: [
              IconButton.filled(
                  style: FilledButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      minimumSize: const Size(60, 60)),
                  onPressed: () => {Navigator.pushNamed(context, "/cart")},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                  )),
              const SizedBox(
                width: 12,
              ),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.grey.shade100,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    minimumSize: const Size(60, 60)
                    // minimumSize: Size.fromHeight(36)
                    ),
                onPressed: () {
                  Provider.of<ShopProvider>(context, listen: false).removeAll();
                  Navigator.popAndPushNamed(context, "/");
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                ),
                label: const Text("Cancel Order"),
              ),
              const SizedBox(
                width: 12,
              )
            ]),
        body: Material(
          child: Consumer<ShopProvider>(builder: (context, provider, child) {
            if (provider.loading == true) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Products",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 16),
                      scrollDirection: Axis.vertical,
                      itemCount: provider.products.length,
                      padding: const EdgeInsets.only(
                          top: 12, left: 16, right: 16, bottom: 12),
                      itemBuilder: (context, index) {
                        final product = provider.products[index];
                        return ProductCard(
                            product: product,
                            productName: product.name,
                            productPrice: product.price.toDouble(),
                            productImage: product.image,
                            productDescription: product.description);
                      },
                    ),
                  ),
                  // const SizedBox(height: 24),
                ],
              );
            }
          }),
        ));
  }
}
