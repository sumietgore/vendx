import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                // decoration: BoxDecoration(
                //   color: Colors.white,
                // ),
                child: Text('VendX'),
              ),
              ListTile(
                leading: const Icon(
                  Icons.grid_view_outlined,
                ),
                title: const Text('Categories'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.inventory_outlined),
                title: const Text("Products"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.shopping_cart_outlined,
                ),
                title: const Text('Cart'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
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
            const SizedBox(height: 48),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Good morning,'),
            ),
            const SizedBox(height: 4),

            // Let's order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh items for you!",
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

            // categories -> horizontal listview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Categories",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10.0),
              children: const [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Text("Hello"),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Text("Hello"),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Text("Hello"),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Text("Hello"),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Text("Hello"),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Text("Hello"),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Text("Hello"),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Text("Hello"),
                ),
              ],
            ))
          ],
        ));
  }
}
