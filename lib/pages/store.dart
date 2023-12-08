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

            // categories -> horizontal listview
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 24),
                    child: GridView.builder(
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                border: Border.all(
                                  color: Colors.grey.shade100,
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text("Hello " + index.toString())));
                        })))
          ],
        ));
  }
}
