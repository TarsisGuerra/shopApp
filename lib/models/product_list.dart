import 'package:flutter/widgets.dart';
import 'package:shop_app/data/dummy_data.dart';
import 'package:shop_app/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  List<Product> get items {
    return [..._items];
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); // Notify listeners about the change to the product list and update the UI accordingly.
  }
}
