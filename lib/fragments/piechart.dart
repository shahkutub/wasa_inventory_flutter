import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DonutPieChart extends StatelessWidget {


  //DonutPieChart(this.seriesList, {this.animate});
  DonutPieChart();

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      //_createSampleData(),
      // Disable animations for image tests.
      //animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
     List<charts.Series> seriesList;
     double width = MediaQuery.of(context).size.width;
     bool animate;
     return  Container(
       height: 200.0,
       width:width,


       child: Center(
         child: ListView(
           scrollDirection: Axis.horizontal,
           children: <Widget>[
             SizedBox(
               child: charts.PieChart(
                 _createSampleData(),
                 animate: true,

         defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 80,

            arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.inside)
        ])
               ),
               height: 220.0,
               width: 220.0,
             ),
             SizedBox(
               child: charts.PieChart(
    _createSampleData(),
    animate: true,

    defaultRenderer: new charts.ArcRendererConfig(
    arcWidth: 80,

    arcRendererDecorators: [
    new charts.ArcLabelDecorator(
    labelPosition: charts.ArcLabelPosition.inside)
    ])
    ),
    height: 220.0,
    width: 220.0,

             ),

           ],
         ),
       ),
     );

//    return new charts.PieChart(
//
//
//        _createSampleData(),
//        animate: true,
//        // Configure the width of the pie slices to 60px. The remaining space in
//        // the chart will be left as a hole in the center.
//        //defaultRenderer: new charts.ArcRendererConfig(arcWidth: 60));
//        defaultRenderer: new charts.ArcRendererConfig(
//            arcWidth: 80,
//
//            arcRendererDecorators: [
//          new charts.ArcLabelDecorator(
//              labelPosition: charts.ArcLabelPosition.outside)
//        ])
//
//    );


  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 10),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 50),
      new LinearSales(4, 55),
      new LinearSales(5, 15),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}