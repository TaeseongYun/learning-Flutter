import 'package:flutter/material.dart';
import 'package:forth_shop_app/ui/widgets/my_shop_drawer.dart';
import 'package:provider/provider.dart';

import '../../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.items.length,
        itemBuilder: (context, index) => OrderItem(
          order: orderData.items[index],
        ),
      ),
      drawer: MyShopDrawer(),
    );
  }
}
