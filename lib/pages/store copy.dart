import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import './../components/product_card.dart';

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('https://vendx-backend.fly.dev/'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final List<Product> products = [];

    for (Map<String, dynamic> item in jsonData) {
      Product product = Product.fromJson(item);
      products.add(product);
    }

    return products;
  } else {  
    throw Exception('Failed to load album');
  }
}

class Product {
  final String name;
  final int price;
  final String image;
  final String description;

  const Product(
      {required this.name,
      required this.price,
      required this.image,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'price': int price,
        'image': String image,
        'description': String description
      } =>
        Product(
            name: name, price: price, image: image, description: description),
      _ => throw const FormatException('Failed to load products.'),
    };
  }
}

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late Future<List<Product>> products;
  int productsLength = 0;

  @override
  void initState() {
    super.initState();
    products = fetchProducts();
    setState(() {
      // Call the setter indirectly
      products.then((products) {
        productsLength = products.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: Drawer(
        //   child: ListView(
        //     // Important: Remove any padding from the ListView.
        //     padding: EdgeInsets.zero,
        //     children: [
        //       const DrawerHeader(
        //         // decoration: BoxDecoration(
        //         //   color: Colors.white,
        //         // ),
        //         child: Text('VendX'),
        //       ),
        //       ListTile(
        //         leading: const Icon(
        //           Icons.grid_view_outlined,
        //         ),
        //         title: const Text('Categories'),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: const Icon(Icons.inventory_outlined),
        //         title: const Text("Products"),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         leading: const Icon(
        //           Icons.shopping_cart_outlined,
        //         ),
        //         title: const Text('Cart'),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
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
        body: Column(
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
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
              child: FutureBuilder(
                future: products,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: SizedBox(
                            width: 32,
                            height: 32,
                            child: CircularProgressIndicator()));
                  } else if (snapshot.hasData) {
                    final products = snapshot.data!;

                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      scrollDirection: Axis.vertical,
                      itemCount: productsLength,
                      padding: const EdgeInsets.all(24),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                            productName: product.name,
                            productPrice: product.price.toDouble(),
                            productImage: product.image,
                            productDescription: product.description);
                      },
                    );
                  } else {
                    return const Text('No data');
                  }
                },
              ),
            ))
          ],
        ));
  }
}
