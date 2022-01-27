import 'package:flutter/cupertino.dart';
import 'package:my_shop/model/product.dart';
import 'package:my_shop/model/product.dart';

enum ChangeQuantity {
  ADD,
  REMOVE
}

class CartProvider with ChangeNotifier {

  Map<String, Product> _products = {};

  Map<String, Product> get products {
    return {..._products};
  }

  double get productsAmount{
    double amount= 0.0;
    _products.forEach((key, value) {
      amount += value.amountForSameProduct;
    });
    return amount;
  }

  double productAmount(Product product){
    double amount = 0.0;
    amount = _products[product.id.toString()]?.amountForSameProduct ?? 0;
    return amount;
  }

  int productQuantity(Product product){
    int quantity = 0;
    quantity = _products[product.id.toString()]?.numberInCart ?? 0;
    return quantity;
  }


  void addProduct(Product product, int quantity) {
    if (_products.containsKey(product.id.toString())) {
      int i = 0;
      while ((i < quantity) && (_products[product.id.toString()]!.numberInCart) < 10) {
        if ((_products[product.id.toString()]!.numberInCart) < 10){
          _products[product.id.toString()]!.numberInCart++;
        i++;
        }
      }
    } else {
      _products.putIfAbsent(product.id.toString(), () => product);
      _products[product.id.toString()]?.numberInCart += quantity-1;
    }
    notifyListeners();
  }

  void changeProductQuantity(Product product, ChangeQuantity changeQuantity) {
    if (_products.containsKey(product.id.toString())) {
      if (changeQuantity == ChangeQuantity.ADD) {
        _products[product.id.toString()]?.numberInCart ++ ;
      } else {
        if (product.numberInCart > 1) {
          _products[product.id.toString()]?.numberInCart -- ;
        }
      }
    }
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.removeWhere((key, value) => key == product.id.toString());
    notifyListeners();
  }

}