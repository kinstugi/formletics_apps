import "package:flutter/material.dart";

class OrderHistoryTile extends StatelessWidget {
  final String orderName;
  final DateTime date;
  final double price;

  final defaultTextStyle = const TextStyle(
    fontSize: 20,
  );

  OrderHistoryTile({
    @required this.orderName,
    @required this.price,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _subWidget(
              top: Text(orderName),
              bottom: const Text('3 month education'),
            ),
            Expanded(
              child: Container(),
            ),
            _subWidget(
              top: const Text('Price'),
              bottom: Text('$price TL'),
            ),
            const SizedBox(width: 20),
            _subWidget(
              top: const Text('Date'),
              bottom: Text('${date.day}/${date.month}/${date.year}'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subWidget({Widget top, Widget bottom}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        top,
        const SizedBox(height: 8),
        bottom,
      ],
    );
  }
}
