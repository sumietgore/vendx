import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import './../components/product_card.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://localhost:8080'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final jsonData = jsonDecode(response.body);
    final List<Product> products = jsonData.map((product) => Product.fromJson(product)).toList();
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Product {
  final String name;
  final int price;
  final String image;
  final String description;

  const Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'price': int price,
        'image': String image,
        'description':String description
      } =>
        Product(
          name: name,
          price: price,
          image: image,
          description: description
        ),
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
  late Future<Product> products;

  @override
  void initState() {
    super.initState();
    products = fetchAlbum();

    fetchAlbum().then((result) {
      print("asd");
      print(result.toString());
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
      appBar: AppBar(title: const Center(child: Text('VendX')), actions: [
        IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/");
            },
            icon: const Icon(Icons.close))
      ]),
       body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Good morning,',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),

          const SizedBox(height: 4),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Let's order some items for you!",
              style: GoogleFonts.openSans(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),

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
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(24),
              children: const [
                ProductCard(
                  productName: 'Coke',
                  productPrice: 20,
                  productImage: 'assets/products/Coke.png',
                  productDescription: 'Coke',
                ),
                ProductCard(
                  productName: 'Coke (Bottle)',
                  productPrice: 20,
                  productImage: 'assets/products/CokeBottle.png',
                  productDescription: 'Coke Bottle',
                ),
                ProductCard(
                  productName: 'Coke (Can)',
                  productPrice: 40,
                  productImage: 'assets/products/CokeCan.png',
                  productDescription: 'Coke Can',
                ),
                ProductCard(
                  productName: 'Coke Zero',
                  productPrice: 20,
                  productImage: 'assets/products/CokeZero.png',
                  productDescription: 'Coke Zero',
                ),
                ProductCard(
                  productName: 'Coke Zero (Bottle)',
                  productPrice: 20,
                  productImage: 'assets/products/CokeZeroBottle.png',
                  productDescription: 'Coke Zero Bottle',
                ),
                ProductCard(
                  productName: 'Coke Zero (Can)',
                  productPrice: 40,
                  productImage: 'assets/products/CokeZeroCan.png',
                  productDescription: 'Coke Zero Can',
                ),
                ProductCard(
                  productName: 'Fanta',
                  productPrice: 20,
                  productImage: 'assets/products/Fanta.png',
                  productDescription: 'Fanta',
                ),
                ProductCard(
                  productName: 'Fanta (Bottle)',
                  productPrice: 20,
                  productImage: 'assets/products/FantaBottle.png',
                  productDescription: 'Fanta Bottle',
                ),
                ProductCard(
                  productName: 'Fanta (Can)',
                  productPrice: 40,
                  productImage: 'assets/products/FantaCan.png',
                  productDescription: 'Fanta Can',
                ),
                ProductCard(
                  productName: 'Pepsi',
                  productPrice: 20,
                  productImage: 'assets/products/Pepsi.png',
                  productDescription: 'Pepsi',
                ),
                ProductCard(
                  productName: 'Pepsi (Bottle)',
                  productPrice: 20,
                  productImage: 'assets/products/PepsiBottle.png',
                  productDescription: 'Pepsi Bottle',
                ),
                ProductCard(
                  productName: 'Pepsi (Can)',
                  productPrice: 40,
                  productImage: 'assets/products/PepsiCan.png',
                  productDescription: 'Pepsi Can',
                ),
                ProductCard(
                  productName: 'Sprite',
                  productPrice: 20,
                  productImage: 'assets/products/Sprite.png',
                  productDescription: 'Sprite',
                ),
                ProductCard(
                  productName: 'Sprite (Bottle)',
                  productPrice: 20,
                  productImage: 'assets/products/SpriteBottle.png',
                  productDescription: 'Sprite Bottle',
                ),
                ProductCard(
                  productName: 'Sprite (Can)',
                  productPrice: 40,
                  productImage: 'assets/products/SpriteCan.png',
                  productDescription: 'Sprite Can',
                ),
                ProductCard(
                  productName: 'Sprite (Can)',
                  productPrice: 40,
                  productImage: 'assets/products/SpriteCan.png',
                  productDescription: 'Sprite Can',
                ),
              ],
            ),
          ))
        ],
      )

      // body: Center(
      //   child: FutureBuilder<Album>(
      //     future: futureAlbum,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return Text(snapshot.data!.title);
      //       } else if (snapshot.hasError) {
      //         return Text('${snapshot.error}');
      //       }

      //       // By default, show a loading spinner.
      //       return const CircularProgressIndicator();
      //     },
      //   ),
      // ),
    );
  }
}
