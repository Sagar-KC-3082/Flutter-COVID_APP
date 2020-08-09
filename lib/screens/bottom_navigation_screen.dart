import 'package:flutter/material.dart';
import 'package:covidapp/screens/screen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScerenState createState() => _BottomNavScerenState();
}

class _BottomNavScerenState extends State<BottomNavScreen> {
  int _current_index = 0;
  final _tabs = [
    HomeScreen(),
    Stats_Screen(),
    Center(child: Text("PROFILE"),),
    Center(child: Text("ORDERS"),),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_current_index],
      bottomNavigationBar:
       BottomNavigationBar(
        currentIndex: _current_index,
        type: BottomNavigationBarType.fixed,
        iconSize: 38,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            title: Text("home"),
            //backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            title: Text("insert_chart"),
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            title: Text("event_note"),
            //backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text("info"),
            //backgroundColor: Colors.grey,
          ),
        ],
        onTap: (index){
          setState(() {
            _current_index = index;
        });
      },
    ),
    );
  }
}
