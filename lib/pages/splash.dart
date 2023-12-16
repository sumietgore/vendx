import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Advertisement(width: width),
              // const Expanded(child: SizedBox()),
              const StartOrder(),
            ],
          ),
        ),
      ),
    );
  }
}

class StartOrder extends StatelessWidget {
  const StartOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    int hour = now.hour;

    String greeting;

    if (hour >= 6 && hour < 12) {
      greeting = 'morning!';
    } else if (hour >= 12 && hour < 18) {
      greeting = 'afternoon!';
    } else if (hour >= 18 && hour < 24) {
      greeting = 'evening!';
    } else {
      greeting = 'night!';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Good $greeting',
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
          padding: EdgeInsets.symmetric(horizontal: 48.0),
          child: Divider(),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 48, left: 24, right: 24),
          child: FilledButton(
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, "/home");
            },
            child: SizedBox(
              height: 36,
              child: Center(
                child: Text(
                  "Start Order",
                  style: GoogleFonts.karla(
                      fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Advertisement extends StatelessWidget {
  const Advertisement({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width,
      child: Center(child: Image.asset("assets/advertisement.jpg")),
    );
  }
}
