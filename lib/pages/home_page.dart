import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/components/cart_app_bar_widget.dart';
import 'package:my_shop/ressources/strings.dart';
import '../model/product.dart';
import '../components/product_tile_widget.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageState();

  }

class _HomePageState extends State<HomePage> {

  final List<Product> _products = Product.products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            "assets/icons/menu.png",
            width: 25
          ),
          onPressed: () => print("bouton menu"),
        ),
        actions: [
          CartAppBarWidget()
        ],
        title: Text(Strings.shopAppTitle),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
        ),
        itemCount: _products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductTile(
              products: _products,
              index: index);
        }

      ),
    );
  }

}



