import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vendx/providers/shop.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:async';

class UPIPage extends StatefulWidget {
  const UPIPage({super.key});

  @override
  State<UPIPage> createState() => _UPIPageState();
}

class _UPIPageState extends State<UPIPage> {
  int remainingTime = 300;
  String _formattedTime = "";
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime <= 0) {
        timer.cancel();
        Navigator.pushReplacementNamed(context, "/");
      } else {
        setState(() {
          remainingTime--;
          _formattedTime = formattedTime(timeInSecond: remainingTime);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
          title: const Text("UPI Payment"),
          toolbarHeight: 80,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ShopProvider>(
              builder: (context, shop, child) {
                return Column(
                  children: [
                    const Expanded(
                        child: SizedBox(
                      height: 100,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Remaining Time ",
                          style: GoogleFonts.karla(fontSize: 16),
                        ),
                        Text(
                          _formattedTime.toString(),
                          style: GoogleFonts.karla(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    QrImageView(
                      data:
                          'upi://pay?pa=9922921605@paytm&pn=Sumit Gore&am=${shop.total.toString()}&cu=INR&',
                      version: QrVersions.auto,
                      size: 240,
                    ),
                    const Expanded(
                      child: SizedBox(height: 100),
                    )
                  ],
                );
              },
            )));
  }
}
