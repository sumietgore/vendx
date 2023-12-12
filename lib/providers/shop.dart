import 'package:flutter/material.dart';
import 'package:vendx/models/cart_item.dart';

import 'package:vendx/services/product.dart';
import 'package:vendx/models/product.dart';

class ShopProvider with ChangeNotifier {
  List<Product> _products = [];
  List<CartItem> _cart = [];
  int _cartTotal = 0;

  bool loading = false;
  DataService services = DataService();

  List<Product> get products => _products;
  List<CartItem> get cart => _cart;
  int get total => _cartTotal;

  getCartProduct<Product>(CartItem item) {
    for (int i = 0; i < _products.length; i++) {
      if (_products[i].id == item.productId) {
        return _products[i];
      }
    }
  }

  _updateCartTotal() {
    _cartTotal = 0;
    for (int i = 0; i < _cart.length; i++) {
      _cartTotal += _cart[i].productTotal;
    }
  }

  removeFromCart(CartItem item) {
    _cart.remove(item);
    _updateCartTotal();
    notifyListeners();
  }

  addToCart(Product product, int qty) {
    //check if the product is already present in the cart
    for (int i = 0; i < _cart.length; i++) {
      if (product.id == cart[i].productId) {
        cart[i].qty += qty;
        cart[i].productTotal = cart[i].productPrice * cart[i].qty;
        _updateCartTotal();
        notifyListeners();
        return;
      }
    }

    final int total = product.price * 1;
    final _temp = CartItem(
        productId: product.id,
        productPrice: product.price,
        qty: qty,
        productTotal: total);
    cart.add(_temp);
    _updateCartTotal();
    notifyListeners();
  }

  getProductsData() async {
    loading = true;
    _products = (await services.getProducts()).cast<Product>();
    loading = false;

    notifyListeners();
  }
}
