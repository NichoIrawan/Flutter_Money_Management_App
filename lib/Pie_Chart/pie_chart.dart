import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({super.key});

  @override
  Widget build(BuildContext context){
    return Stack(
      alignment: Alignment.center,
      children: [
        
        //Pie Chart title
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
                'This Month',
                style: TextStyle(
                  fontSize: 12.98, 
                  color: Color.fromRGBO(119, 121, 121, 1.0),
                ),
              ),
            Stack(children: <Widget> [
              textStrokes(),
              Text(

                //Placeholder for value -> income.total - expense.total
                '1.000.000',
                style: TextStyle(
                  fontSize: 21, 
                  color: Color.fromRGBO(146, 208, 211, 1.0),
                ),
              ),
            ],),
              Text(

                //Placeholder for month in overview -> coonect with today's month
                'Jul',
                style: TextStyle(
                  fontSize: 12.98, 
                  color: Color.fromRGBO(119, 121, 121, 1.0),
                ),
              ),
          ],
        ),

        //Pie chart data
        ChartData(),
      ],
    );
  }

  PieChart ChartData() {
    return PieChart(
      PieChartData(
        centerSpaceRadius: 60,
        sectionsSpace: 0,
        startDegreeOffset: 270,
        sections: [

          //Income
          PieChartSectionData(
            //Placeholder for value -> connect to income.total
            value: 2000,
            color: Color.fromRGBO(146, 208, 211, 1.0),
            showTitle: false,
            radius: 15,
          ),

          //Expense
          PieChartSectionData(
            //Placeholder for value -> connect to expense.total
            value: 1000,
            color: Color.fromRGBO(235, 227, 206, 1.0),
            showTitle: false,
            radius: 15,
          ),

          //BG
          PieChartSectionData(
            value: 1,
            color: Color.fromRGBO(215, 218, 218,1.0),
            showTitle: false,
            radius: 15,
          )
        ]
      )
    );
  }
}

class textStrokes extends StatelessWidget {

  const textStrokes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '1.000.000', 
      style: TextStyle(
        fontSize: 21, 
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5
          ..color = Color.fromRGBO(36, 40, 40, 0.05)
      ),
    );
  }
}

class pieChartLegends extends StatelessWidget {
  const pieChartLegends({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.lens_rounded, 
              size: 5,
              color: Color.fromRGBO(146, 208, 211, 1.0),
            ), 
            Text(
              '  Income',
              style: TextStyle(
                fontSize: 12.98,
                color: Color.fromRGBO(120, 121, 121, 1.0)
              ),
            )
          ], 
        ), 
        Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '1.000.000',
              style: TextStyle(
                fontSize: 21,
                color: Color.fromRGBO(146, 208, 211, 1.0)
              ),
            )
          ], 
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.lens_rounded, 
              size: 5,
              color: Color.fromRGBO(235, 227, 206, 1.0),
            ), 
            Text(
              '  Expenses',
              style: TextStyle(
                fontSize: 12.98,
                color: Color.fromRGBO(120, 121, 121, 1.0)
              ),
            )
          ], 
        ), 
        Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '1.000.000',
              style: TextStyle(
                fontSize: 21,
                color: Color.fromRGBO(235, 227, 206, 1.0)
              ),
            )
          ], 
        ), 
      ],
    );
  }
}