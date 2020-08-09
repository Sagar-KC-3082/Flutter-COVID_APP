import 'package:covidapp/Widgets/country_drop_down.dart';
import 'package:covidapp/config/styles.dart';
import 'package:covidapp/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/config/palette.dart';
import 'package:covidapp/data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country = "USA";
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverList(
           delegate: SliverChildListDelegate(<Widget>[
             Container(padding:EdgeInsets.fromLTRB(20, 20,0,0),decoration: BoxDecoration(color: Palette.primaryColor,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("COVID-19",
                            style: TextStyle(color: Colors.white,fontSize: 27,fontWeight: FontWeight.bold),
                      ),
                      CountryDropDown(
                        countries:  ["CN","FR","IN","IT","UK","USA"],
                        country: _country,
                        onChanged: (val){
                          setState(() {
                            _country = val;
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight*0.03,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Are you feeling sick?",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w600),),
                      SizedBox(height: screenHeight*0.01,),
                      Text("If you feeling sick with any COVID-19 symptoms,please call or text us immediately for help",style:TextStyle(color: Colors.white70,fontSize: 16,fontWeight: FontWeight.w600),),
                      SizedBox(height:screenHeight*0.03,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0,0,15),
                                child: FlatButton.icon(
                                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),color: Colors.red,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),onPressed: (){}, icon: Icon(Icons.call), label:Text("Call Now",style: Styles.buttonTextStyle,),textColor: Colors.white,
                                ),
                              ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0,20,15),
                            child: FlatButton.icon(
                              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),color: Colors.blue,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),onPressed: (){}, icon: Icon(Icons.message), label:Text("Send SMS",style: Styles.buttonTextStyle,),textColor: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
             ),
              
             Container(
               padding: EdgeInsets.all(20),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text("Prevention Tips",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                   SizedBox(height: 20,),
                   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: prevention.map((e) {return Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                          Image.asset(e.keys.first,height: screenHeight*0.12,),
                          SizedBox(height: screenHeight*0.015,),
                          Text(e.values.first,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),textAlign: TextAlign.center,)

                   ]
                   );}).toList()
                   )
                 ],
               ),
             ),

           Container(
             padding: EdgeInsets.all(5),
             margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
             height: screenHeight*0.17,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               gradient: LinearGradient(colors: [Color(0xFFAD9FE4),Palette.primaryColor])
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: <Widget>[
                 Image.asset('assets/photos/own_test.png'),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                   Text("Do your own test",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold)),
                   SizedBox(height: screenHeight*0.01,),
                   Text("Follow the intructions\n to do your own test",style: TextStyle(fontSize: 16,color: Colors.white,))
                 ],)
               ],
             ),
           ),

           ]),
          )
        ],
      )
    );
  }
}
