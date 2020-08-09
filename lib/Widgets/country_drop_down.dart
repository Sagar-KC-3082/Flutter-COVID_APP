import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CountryDropDown extends StatelessWidget {

  final List<String> countries;
  final String country;
  final Function(String)onChanged;

  CountryDropDown({this.countries, this.country, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15,0,25,0),
      padding: EdgeInsets.fromLTRB(10,0,0,0),
      height: 37,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: DropdownButton<String>(
        items: countries.map((String obj){
          return DropdownMenuItem<String>(
           value: obj,
           child: Row(children: <Widget>[
             Image.asset('assets/photos/${obj.toLowerCase()}_flag.png',height: 30,width: 18,),
             SizedBox(width:10),
             Text(obj,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
           ],)
          );
        }).toList(),
        value: country,
        onChanged: onChanged,
      ),

    );
  }
}
