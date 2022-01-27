import 'package:flutter/material.dart';
import '../model/product.dart';
import '../pages/product_details_page.dart';

class ProductTile extends StatelessWidget {

  final int index;

  const ProductTile({
    Key? key,
    required List<Product> products,
    required this.index,
  }) : _products = products, super(key: key);

  final List<Product> _products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetails(product: _products[index])
                )
            );
          },
          child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: _products[index].backgroundColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                  //border: Border.all(
                  //color: Colors.grey,
                  //width: 4,
                  //),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(-2.0, 2.0),
                      blurRadius: 2,
                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset(_products[index].image),
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
              _products[index].title
          ),
        ),
        Text(
            _products[index].price.toStringAsFixed(0) + "€"
        ),
      ],
    );
  }
}