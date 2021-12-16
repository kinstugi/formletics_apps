import 'package:flutter/material.dart';

enum BloodType { O, A, B, AB }

class CustomExpansionHead extends StatelessWidget {
  final BloodType bloodType;
  final double weight;
  final double height;
  final double bodyFat;

  const CustomExpansionHead({
    this.bloodType = BloodType.O,
    this.weight = 85.0,
    this.height = 187.0,
    this.bodyFat = 14.8,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Blood Type'),
            Text(bloodType.toString()),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Weight'),
            Text('$weight'),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Height'),
            Text('$height'),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Body Fat'),
            Text('$bodyFat'),
          ],
        ),
      ],
    );
  }
}
