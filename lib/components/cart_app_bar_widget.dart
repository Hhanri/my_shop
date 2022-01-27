import 'package:flutter/material.dart';
import 'package:my_shop/components/cart_notification_counter_widget.dart';
import 'package:my_shop/pages/cart_page.dart';

class CartAppBarWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Image.asset(
            "assets/icons/shopping-cart-grey.png",
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage())
            );
          },
        ),
        CartNotificationCounterWidget()
      ],
    );
  }
}