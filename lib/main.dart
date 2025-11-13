import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product_list.dart';
import 'package:shop_app/pages/product_detail_page.dart';
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
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          primaryColor: Colors.purple,
          highlightColor: Colors.deepOrange,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewPage(),
        routes: {AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage()},
      ),
    );
  }
}
