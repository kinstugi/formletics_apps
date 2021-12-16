import 'package:charts_flutter/flutter.dart' as chart;

class SalesChartModel {
  final int date;
  final int amount;
  final chart.Color bgColor;

  SalesChartModel({
    this.amount,
    this.bgColor,
    this.date,
  });
}

List<SalesChartModel> chartsData = [
  SalesChartModel(amount: 10000, date: 1),
  SalesChartModel(amount: 30162, date: 2),
  SalesChartModel(amount: 26263, date: 3),
  SalesChartModel(amount: 18934, date: 4),
  SalesChartModel(amount: 18287, date: 5),
  SalesChartModel(amount: 28682, date: 6),
  SalesChartModel(amount: 31274, date: 7),
  SalesChartModel(amount: 33259, date: 8),
  SalesChartModel(amount: 25849, date: 9),
  SalesChartModel(amount: 24159, date: 10),
  SalesChartModel(amount: 32651, date: 11),
  SalesChartModel(amount: 31984, date: 12),
  SalesChartModel(amount: 38451, date: 13),
];
