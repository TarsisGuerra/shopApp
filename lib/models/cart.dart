import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_item.dart';
import 'package:shop_app/models/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      // Change quantity...
      _items.update(
        product.id,
        (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
          productId: product.id,
        ),
      );
    } else {
      _items.putIfAbsent(
        //push if absent -> adicionar se ausente
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          name: product.name,
          quantity: 1,
          price: product.price,
          productId: product.id,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
