import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
              style: IconButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  minimumSize: const Size(60, 60)),
            ),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.grey.shade50,
            toolbarHeight: 80,
            title: const Text("Payment")),
        body: Material(
          color: Colors.grey.shade50,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FilledButton(
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            backgroundColor: Colors.grey.shade200,
                            foregroundColor: Colors.grey.shade900,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/payment/upi");
                          },
                          child: SizedBox(
                            width: 80,
                            child: SvgPicture.asset(
                              "assets/upi.svg",
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
                            backgroundColor: Colors.grey.shade200,
                            foregroundColor: Colors.grey.shade900,
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.credit_card_outlined,
                            size: 32,
                          ),
                          label: SizedBox(
                            height: 30,
                            child: Center(
                              child: Text(
                                "Card",
                                style: GoogleFonts.karla(
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ))
                    ]),
              ),
            ),
          ),
        ));
  }
}
