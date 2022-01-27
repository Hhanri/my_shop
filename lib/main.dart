import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart_provider.dart';
import 'package:my_shop/ressources/theme.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {

  final String title = "Shop App";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "OpenSans",
        ),
          home: HomePage(
            title: title,
        ),
      ),
    );
  }

}