import 'package:flutter/material.dart';
import '../models/product.dart';

class AddToCartProvider extends ChangeNotifier {
  final List<Product> _cartItems = [];
  List<Product> get cartItems => _cartItems;
  void addProductToCart(Product product) {
    try {
      _cartItems.add(product);
      notifyListeners();
    } catch (e) {
      debugPrint('$e');
    }
  }

  void removeProductFromCart(Product product) {
    try {
      _cartItems.remove(product);
      notifyListeners();
    } catch (e) {
      debugPrint("$e");
    }
  }

  double get totalPrice =>
      _cartItems.fold(0.0, (sum, item) => sum + item.price);
}
