import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders_provider.dart';
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersPage extends StatefulWidget {
  static const routeName = '/orders';

  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // if there is a part of widget changed, all widget would be fetched
  // to avoid this, use the approach below
  late Future _ordersFuture;
  Future _obtainOrdersFuntion() {
    return context.read<OrdersProvider>().fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuntion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<OrdersProvider>(context); -> move to Consumer

    return Scaffold(
      appBar: AppBar(
        title: const Text('your orders'),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _ordersFuture,
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              return const Center(child: Text('an error ocurred!'));
            } else {
              return Consumer<OrdersProvider>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (BuildContext ctx, int i) =>
                      OrderItem(orderData.orders[i]),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
