import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/splash.dart';
import 'pages/store.dart';

void main(List<String> args) {
  print(args.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            primary: Colors.black,
            background: Colors.grey.shade50
          ),
          platform: TargetPlatform.linux,
          useMaterial3: true,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          '/': (context) => const StartPage(),
          '/home': (context) => StorePage(),
        });
  }
}
