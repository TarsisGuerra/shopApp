import 'package:flutter/widgets.dart';
import 'package:shop_app/data/dummy_data.dart';
import 'package:shop_app/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  bool _showFavoritesOnly = false;

  List<Product> get items {
    if (_showFavoritesOnly) {
      return _items.where((prod) => prod.isFavorite).toList();
    } else {
      return [..._items];
    }
  }

  void showFavoritesOnly() {
    _showFavoritesOnly = true;
    notifyListeners(); // Notify listeners about the change to the product list and update the UI accordingly.
  }

  void showAll() {
    _showFavoritesOnly = false;
    notifyListeners(); // Notify listeners about the change to the product list and update the UI accordingly.
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); // Notify listeners about the change to the product list and update the UI accordingly.
  }
}
