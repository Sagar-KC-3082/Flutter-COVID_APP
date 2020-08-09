import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidapp/Widgets/Bar_Chart_Data.dart';

class CovidBarChart extends StatelessWidget {

  final List<Bar_Chart_Data> data;
  CovidBarChart({@required this.data});

  @override
  Widget build(BuildContext context) {


    List<charts.Series<Bar_Chart_Data,String>> series = [
      charts.Series(
        data: data,
        domainFn: (obj,_) => obj.date,
        measureFn: (obj,_) => obj.count,

      )
    ];

    return Container(
      margin: EdgeInsets.fromLTRB(0,15,0,0),
     padding: EdgeInsets.all(20),
     //height: 450,
     decoration: BoxDecoration(
         color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
     ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
        Text("Daily New Cases",style: TextStyle(fontSize: 30),),
        SizedBox(height: 40,),
        Container(
          color: Colors.white,
          height: 300,
          child: charts.BarChart(
          series,animate: true,
          ),
        )
       ],
     ),
   );
  }
}
