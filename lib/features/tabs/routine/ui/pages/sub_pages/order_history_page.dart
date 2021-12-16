import 'package:flutter/material.dart';
import '../../widgets/order_history_tile.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            OrderHistoryTile(
              orderName: 'Weight loss',
              price: 99.78,
              date: DateTime.now(),
            )
          ],
        ),
      ),
    );
  }
}
