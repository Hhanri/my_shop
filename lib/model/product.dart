import 'package:flutter/material.dart';

class Product {
  final String title, description, image;
  final UniqueKey id;
  final Color backgroundColor;
  final double price;
  final List<int> sizes;
  int numberInCart = 1;

  double get amountForSameProduct{
    return numberInCart*price;
  }

  Product(
    this.title,
    this.description,
    this.image,
    this.backgroundColor,
    this.price,
    this.sizes
    ) : id = UniqueKey();

  static List<Product> products =
    [
      Product(
        'Red shoes',
        loremIpsum,
        "assets/images/red-shoe.png",
        const Color(0xFFEF5350),
        90.00,
        [42,43,44,45],
      ),
      Product(
        'Black shoes',
        loremIpsum,
        "assets/images/black-shoe.png",
        const Color(0xFF757575),
        90.00,
        [42,45],
      ),
      Product(
        'Blue shoes',
        loremIpsum,
        "assets/images/blue-shoe.png",
        const Color(0xFF7986CB),
        90.00,
        [40,41,42,43,44,45],
      ),
      Product(
        'Orange shoes',
        loremIpsum,
        "assets/images/orange-shoe.png",
        const Color(0xFFFFB74D),
        90.00,
        [43,44,45],
      ),
      Product(
        'Turquoise shoes',
        loremIpsum,
        "assets/images/turquoise-shoe.png",
        const Color(0xFF64B5F6),
        90,
        [38,39,40,41,42,43],
      ),
      Product(
        'B/W shoes',
        loremIpsum,
        "assets/images/black-and-white-shoe.png",
        const Color(0xFFAED581),
        90,
        [40,41,42,43]
      )

    ];


}

String loremIpsum = "Lorem Ipsum is slechts een proeftekst uit het drukkerij- en zetterijwezen. Lorem Ipsum is de standaard proeftekst in deze bedrijfstak sinds de 16e eeuw, toen een onbekende drukker een zethaak met letters nam en ze door elkaar husselde om een font-catalogus te maken. Het heeft niet alleen vijf eeuwen overleefd maar is ook, vrijwel onveranderd, overgenomen in elektronische letterzetting. Het is in de jaren '60 populair";