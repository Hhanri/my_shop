import 'package:flutter/material.dart';
import 'package:my_shop/components/add_remove_widget.dart';
import 'package:my_shop/components/elevated_button_widget.dart';
import 'package:my_shop/model/product.dart';
import 'package:my_shop/providers/cart_provider.dart';
import 'package:my_shop/ressources/strings.dart';

import 'package:my_shop/ressources/theme.dart';
import 'package:my_shop/utils/extensions.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _cartProvider = Provider.of<CartProvider>(context);
    final _cartMap =  _cartProvider.products;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: TEXT_COLOR
        ),
        title: Text(
          Strings.cartTitle,
            style: TextStyle(
              color: TEXT_COLOR,
              fontSize: 18
            ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget> [
            Expanded(
              flex: 8,
              child:
              (_cartMap.length > 0) ?
                ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  Product _currentProduct = _cartMap.values.elementAt(index);
                  return Dismissible(
                    key: GlobalKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      _cartProvider.removeProduct(_currentProduct);
                    },
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.delete_sweep,
                          color: Colors.red,

                        )
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        leading: Image.asset(
                          _currentProduct.image,
                          height: 200,
                        ),
                        title: FittedBox(
                          child: Text(
                            _currentProduct.title
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                        subtitle: FittedBox(
                          child: Text(
                            Strings.sneakerCategoryTitle,
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                        trailing: SizedBox(
                          child: Row(
                            children: [
                              Expanded(
                                child: AddRemoveWidget(
                                  quantityToDisplay: _cartProvider.productQuantity(_currentProduct).toString(),
                                  pressMinusButton: () {
                                    if (_cartProvider.productQuantity(_currentProduct) > 1) {
                                      _cartProvider.changeProductQuantity(_currentProduct, ChangeQuantity.REMOVE);
                                    }
                                  },
                                  pressPlusButton: () {
                                    if (_cartProvider.productQuantity(_currentProduct) < 10) {
                                      _cartProvider.changeProductQuantity(_currentProduct, ChangeQuantity.ADD);
                                    }
                                  },
                                ),
                                flex: 6
                              ),
                              Spacer(
                                flex:1
                              ),
                              Expanded(
                                child: Text(_currentProduct.amountForSameProduct.displayPriceInEuros()),
                                flex: 3
                              )
                            ],
                          ),
                          width: 100,
                        ) ,
                      )
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10
                  );
                },
                itemCount: _cartMap.length,
              )
              : Text(Strings.noItemInCartTitle)
              ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(top: 20) ,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(-5, 5)
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.vatRateTitle
                          ),
                          Text(
                            (_cartProvider.productsAmount*0.2).displayPriceInEuros(),
                          )
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.totalVATIncluded,
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            _cartProvider.productsAmount.displayPriceInEuros(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButtonWidget(
                          backgroundColor: Colors.grey,
                          textToDisplay: Strings.checkOut,
                          onClickCallBack: () {
                            //fonction
                          },
                        )
                      )
                    )
                  ],
                )
              )
            )
          ]
        ),
      ),

    );
  }
}
