import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/app_drawer.dart';
import 'package:shop_app/components/order.dart';
import 'package:shop_app/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Meus Pedidos')),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
        itemCount: orders.itemsCount,
      ),
      drawer: AppDrawer(),
    );
  }
}
