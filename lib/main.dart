// import 'package:exelon_shopping/pages/home_page.dart';
import 'package:exelon_shopping/pages/home_page.dart';
import 'package:exelon_shopping/pages/product_cart.dart';
import 'package:exelon_shopping/widgets/cart_total.dart';
import 'package:exelon_shopping/widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: const SafeArea(
        child: HomePage(),
        ),
    );
  }
}
