import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 80, title: const Text("Payment")),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton.icon(
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/payment/upi");
                      },
                      icon: const Icon(Icons.qr_code_outlined),
                      label: SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            "UPI",
                            style: GoogleFonts.karla(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 24,
                  ),
                  FilledButton.icon(
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.credit_card_outlined),
                      label: SizedBox(
                        height: 30,
                        child: Center(
                          child: Text(
                            "Card",
                            style: GoogleFonts.karla(
                                fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ))
                ]),
          ),
        ));
  }
}
