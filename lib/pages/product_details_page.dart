import 'package:flutter/material.dart';
import 'package:my_shop/components/cart_app_bar_widget.dart';
import 'package:my_shop/components/elevated_button_widget.dart';
import 'package:my_shop/providers/cart_provider.dart';
import 'package:my_shop/ressources/strings.dart';
import 'package:my_shop/ressources/theme.dart';
import 'package:provider/provider.dart';

import '../components/add_remove_widget.dart';
import '../components/dropdown_button_widget.dart';
import '../model/product.dart';
import '../components/subtitle_product_widget.dart';
import '../components/title_product_widget.dart';
import '../utils/extensions.dart';

class ProductDetails extends StatefulWidget {

  final Product product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  int _productQuantity = 1;

  @override
  Widget build(BuildContext context) {

    final _cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.product.backgroundColor,
        elevation: 0,
        actions: [
          CartAppBarWidget()
        ],
      ),
      backgroundColor: widget.product.backgroundColor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight*0.35,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubtitleProductWidget(text: Strings.sneakerCategoryTitle),
                              TitleProductWidget(text: widget.product.title)
                            ]
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubtitleProductWidget(text: Strings.priceTitle),
                              TitleProductWidget(text: widget.product.price.displayPriceInEuros())
                            ]
                          )
                        ]
                      ),
                    )
                  ),
                ),
                Container(
                  height: constraints.maxHeight*0.65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight:Radius.circular(20)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0, left: 25, right: 25),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                               Expanded(
                                child: Text(
                                  Strings.stockTitle,
                                  style: TextStyle(
                                    color: TEXT_COLOR,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  )
                                )
                              ),
                              Expanded(
                                child: dropdown_button_widget(backgroundColor: widget.product.backgroundColor, sizes: widget.product.sizes)
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 4,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  widget.product.description
                                ),
                              ],
                            ),
                          )
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: AddRemoveWidget(
                                  quantityToDisplay: _productQuantity.toString(),
                                  pressMinusButton: () {
                                    setState(() {
                                      if (_productQuantity > 1) {
                                        _productQuantity--;
                                      }
                                    });
                                  },
                                  pressPlusButton: () {
                                    setState(() {
                                      if (_productQuantity < 10) {
                                        _productQuantity++;
                                      }
                                    });
                                  },
                                ),
                              ),
                              const Spacer(
                                flex: 1
                              ),
                              Expanded(
                                flex: 7,
                                child: ElevatedButtonWidget(
                                  backgroundColor: widget.product.backgroundColor,
                                  textToDisplay: Strings.addToCartTitle,
                                  onClickCallBack: () {
                                    print(_productQuantity);
                                    Product product = widget.product;
                                    print(product.numberInCart);
                                    _cartProvider.addProduct(product, _productQuantity);
                                    setState(() {
                                      _productQuantity = 1;
                                    });
                                  }
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ),
                Positioned(
                  top: (constraints.maxHeight*0.65)*0.35,
                  left: constraints.maxWidth*0.35,
                  child: Image.asset(
                    "${widget.product.image}"
                  ),
                  width: constraints.maxWidth/2
                )
              ]
            ),
          );
        },
      ),
    );
  }
}









