import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vendx/models/cart_item.dart';
import 'package:vendx/models/product.dart';
import 'package:vendx/providers/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Cart")),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(child:
                  Consumer<ShopProvider>(builder: (context, shop, child) {
                return shop.cart.isEmpty
                    ? const Center(child: Text("Your cart is empty!"))
                    : ListView.builder(
                        itemCount: shop.cart.length,
                        // padding: const EdgeInsets.all(12),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final Product product =
                              shop.getCartProduct(shop.cart[index]);
                          final CartItem item = shop.cart[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                child: Row(children: [
                                  Image.asset(product.image),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: GoogleFonts.montserrat(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          // color: Colors.deepPurple.shade900
                                        ),
                                      ),
                                      // Text(product.price.toString())
                                    ],
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Text(item.qty.toString()),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  Text(item.productTotal.toString()),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  IconButton.filled(
                                      style: IconButton.styleFrom(
                                          backgroundColor: Colors.black),
                                      onPressed: () =>
                                          {shop.removeFromCart(item)},
                                      icon: const Icon(Icons.remove))
                                ]),
                              ),
                            ),
                          );
                        });
              })),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Cart Total",
                            style: GoogleFonts.karla(
                                fontSize: 16, fontWeight: FontWeight.normal)),
                        const SizedBox(
                          width: 12,
                        ),
                        Consumer<ShopProvider>(
                          builder: (context, shop, child) => Text(
                            shop.total.toString(),
                            style: GoogleFonts.montserrat(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 24),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0)),
                            ),
                            onPressed: () {
                              Provider.of<ShopProvider>(context, listen: false)
                                  .removeAll();
                              Navigator.popAndPushNamed(context, "/");
                            },
                            icon: const Icon(Icons.close),
                            label: SizedBox(
                                height: 30,
                                child: Center(
                                    child: Text(
                                  "Cancel Order",
                                  style: GoogleFonts.karla(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                )))),
                        const SizedBox(
                          width: 24,
                        ),
                        FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.grey.shade100,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 24),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0)),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/payment');
                            },
                            icon: const Icon(Icons.payments_outlined),
                            label: SizedBox(
                                height: 30,
                                child: Center(
                                    child: Text(
                                  "Proceed to Payment",
                                  style: GoogleFonts.karla(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ))))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
