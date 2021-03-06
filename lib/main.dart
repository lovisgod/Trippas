import 'dart:async';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:trippas/screens/TripList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trippas',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
      }
      
    }
    
  class HomePageState extends State {
     @override
    void initState() {
    super.initState();
    move();
  }
     @override
     Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Trippas",
              style: TextStyle(
                fontSize: 40.0,
                color: Color(0xff3E64FF)
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Color(0xffFF3E6C),
              strokeWidth: 1,
           )
         ],
       ),
      ),
    );
  }

   move() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route(){
    Toast.show("Welcome User", context, 
    duration: Toast.LENGTH_SHORT,
     gravity:  Toast.BOTTOM,
      backgroundColor: Color(0xff3E64FF),
      textColor: Colors.white
      );
     Navigator.push(context, MaterialPageRoute(builder: (context) =>TripList()));
  }
}
