import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/orders_provider.dart';
import 'package:shop/widget/app_drawer.dart';
import 'package:shop/widget/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) =>
            OrderItemWidget(orderData.orders[index]),
      ),
    );
  }
}
