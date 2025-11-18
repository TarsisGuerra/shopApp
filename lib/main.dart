import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/auth.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/order_list.dart';
import 'package:shop_app/models/product_list.dart';
import 'package:shop_app/pages/auth_page.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/orders_page.dart';
import 'package:shop_app/pages/product_detail_page.dart';
import 'package:shop_app/pages/product_form_page.dart';
import 'package:shop_app/pages/product_page.dart';
import 'package:shop_app/pages/products_overview_page.dart';
import 'package:shop_app/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList()),
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          primaryColor: Colors.purple,
          highlightColor: Colors.deepOrange,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'Lato',
        ),
        //home: ProductsOverviewPage(),
        routes: {
          AppRoutes.AUTH: (ctx) => AuthPage(),
          AppRoutes.HOME: (ctx) => ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage(),
          AppRoutes.CART: (ctx) => CartPage(),
          AppRoutes.ORDERS: (ctx) => OrdersPage(),
          AppRoutes.PRODUCTS: (ctx) => ProductsPage(),
          AppRoutes.PRODUCTS_FORM: (ctx) => ProductFormPage(),
        },
      ),
    );
  }
}
