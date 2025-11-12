import 'package:flutter/material.dart';
import 'package:shop_app/components/product_item.dart';
import 'package:shop_app/data/dummy_data.dart';
import 'package:shop_app/models/product.dart';

class ProductsOverviewPage extends StatelessWidget {
  ProductsOverviewPage({super.key});
  final List<Product> loadedProducts = dummyProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minha Loja')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItem(product: loadedProducts[i]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
