import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/app_drawer.dart';
import 'package:shop_app/components/badgee.dart';
import 'package:shop_app/components/product_grid.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/product_list.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Somente Favoritos'),
              ),
              PopupMenuItem(value: FilterOptions.all, child: Text('Todos')),
            ],
            onSelected: (selectedValue) {
              if (selectedValue == FilterOptions.favorites) {
                provider.showFavoritesOnly();
              } else {
                provider.showAll();
              }
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/cart');
              },
              icon: Icon(Icons.shopping_cart),
            ),
            builder: (ctx, cart, child) => Badgee(
              value: cart.itemCount.toString(),
              child: child!,
            ), // ! to force non-null
          ),
        ],
      ),

      body: ProductGrid(),
      drawer: AppDrawer(),
    );
  }
}
