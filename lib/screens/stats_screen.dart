import 'package:covidapp/Widgets/covid_bar_chart.dart';
import 'package:covidapp/Widgets/Bar_Chart_Data.dart';
import 'package:covidapp/config/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covidapp/config/styles.dart';

class Stats_Screen extends StatefulWidget {
  @override
  _Stats_ScreenState createState() => _Stats_ScreenState();
}

class _Stats_ScreenState extends State<Stats_Screen> {

  final List<Bar_Chart_Data> data = [
    Bar_Chart_Data(
      date: "May21",
     count: 12000,
    ),
    Bar_Chart_Data(
      date: "May22",
      count: 13000,
    ),
    Bar_Chart_Data(
      date: "May23",
      count: 15600,
    ),
    Bar_Chart_Data(
      date: "May24",
      count: 16870,
    ),
    Bar_Chart_Data(
      date: "May25",
      count: 19000,
    ),
    Bar_Chart_Data(
      date: "May26",
      count: 23000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.primaryColor,
        appBar: AppBar(
          backgroundColor: Palette.primaryColor,
          elevation: 0,
          leading: IconButton(
            icon:Icon(Icons.menu,color:Colors.white),
            iconSize: 28,
            onPressed: (){},
          ),
          actions: <Widget>[IconButton(
            icon:Icon(Icons.notifications_none),
            iconSize: 28,
            color: Colors.white,
            onPressed: (){},
          )
          ],
        ),
        body:CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                Container(padding:EdgeInsets.all(20),child: Text("Statistics",style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                DefaultTabController(
                  length: 2,
                  child: Container(height:50,margin: EdgeInsets.all(20),decoration: BoxDecoration(color: Colors.white24,borderRadius: BorderRadius.circular(30)),
                        child: TabBar(
                          indicator: BubbleTabIndicator(
                              indicatorHeight: 40,
                              indicatorColor: Colors.white,
                          ),
                          labelStyle: Styles.tabTextStyle,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.white,
                          tabs: <Widget>[
                           Text("My Country",style:TextStyle(fontSize: 19),),
                            Text("Global",style:TextStyle(fontSize: 19))
                          ],
                        ),
                      ),
                  ),
                Container(
                  padding: EdgeInsets.fromLTRB(0,10,0,0),
                  child: DefaultTabController(
                    length: 3,
                    child: TabBar(
                      indicatorColor: Colors.transparent,
                      labelStyle: Styles.tabTextStyle,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white60,
                      tabs: <Widget>[
                        Text("Total"),
                        Text("Today"),
                        Text("Yesterday")
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(7,20,7,0),
                  height: MediaQuery.of(context).size.height * 0.32,
                  child:
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              BuildContainer(Text1:"Total Cases",Text2:"1.81M",Text3: Colors.orange,),
                              BuildContainer(Text1:"Deaths",Text2:"232K",Text3: Colors.red,)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              BuildContainer(Text1: "Recovered",Text2: "391K",Text3: Colors.green,),
                              BuildContainer(Text1: "Active",Text2: "1.56M",Text3:Colors.lightBlue),
                              BuildContainer(Text1: "Critical",Text2: "N/A",Text3:Colors.purple)
                            ],
                          ),
                        )
                      ],
                    )
                ),
                CovidBarChart(data:data),
              ]),
            )
          ],
        )
    );
  }
}


//Function for creating container of given color along with some texts.. :)
class BuildContainer extends StatelessWidget {
  String Text1;
  String Text2;
  Color Text3;
  BuildContainer({this.Text1,this.Text2,this.Text3});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(color:Text3,borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      Text(Text1,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),),
      Text(Text2,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold))
      ],
      ),
      ),
    );
  }
}
