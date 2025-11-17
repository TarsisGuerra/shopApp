import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/order.dart';
import 'package:shop_app/utils/constantes.dart';

class OrderList with ChangeNotifier {
  final List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> addOrder(Cart cart) async {
    final date = DateTime.now();

    final response = await post(
      Uri.parse('${Constantes.ORDER_BASE_URL}/orders.json'),
      body: jsonEncode({
        'total': cart.totalAmount,
        'date': date.toIso8601String(),
        'products': cart.items.values
            .map(
              (cartItem) => {
                'id': cartItem.id,
                'name': cartItem.name,
                'quantity': cartItem.quantity,
                'price': cartItem.price,
              },
            )
            .toList(),
      }),
    );

    final id = jsonDecode(response.body)['name'];
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        products: cart.items.values.toList(),
        date: date,
      ),
    );
    notifyListeners();
  }
}
