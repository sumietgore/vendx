import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/': (context) => StartPage(),
          '/home': (context) => StorePage(),
        });
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/home");
          },
          child: const Row(
            children: [
              Icon(Icons.shopping_cart),
              Text("Start Order"),
            ],
          ),
        ),
      ),
    );
  }
}

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            title: const Center(child: Text('VendX')),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_checkout),
                onPressed: () => {},
              ),
              IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/");
                  },
                  icon: const Icon(Icons.close))
            ]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8.0),
            children: [
              Container(
                width: 300,
                height: 100,
                child: Text("Hello"),
              ),
              Container(
                width: 300,
                height: 100,
                child: Text("Hello"),
              ),
              Container(
                width: 300,
                height: 100,
                child: Text("Hello"),
              ),
              Container(
                width: 300,
                height: 100,
                child: Text("Hello"),
              ),
              Container(
                width: 300,
                height: 100,
                child: Text("Hello"),
              ),
              Container(
                width: 300,
                height: 100,
                child: Text("Hello"),
              ),
            ],
          ),
        ));
  }
}
