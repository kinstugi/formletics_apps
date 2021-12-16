import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as chart;
import 'package:formletics/features/panels/trainer_panel/data/models/sportsman/response/sale_chart_model.dart';

class SalesChartWidget extends StatelessWidget {
  const SalesChartWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final series = [
      chart.Series(
        id: "Sales",
        data: chartsData,
        domainFn: (SalesChartModel sales, _) => sales.date,
        measureFn: (SalesChartModel sales, _) => sales.amount,
      )
    ];
    return Container(
      height: 300,
      padding: const EdgeInsets.all(15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Graph of Sales History",
                style: Theme.of(context).textTheme.headline6.copyWith(),
              ),
              Expanded(
                child: chart.LineChart(
                  series,
                  animate: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
