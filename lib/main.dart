import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trippas',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    
  Future.delayed(const Duration(milliseconds: 1000), () {
     Toast.show(
       "Welcome to Trippas",
        context,
        duration: Toast.LENGTH_LONG,
        textColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        gravity:  Toast.BOTTOM 
     );
   });
    return Scaffold(
      body: Center(
        child: Text(
          "Trippas",
          style: TextStyle(
             color: Colors.deepPurple,
             fontWeight: FontWeight.bold,
             fontSize: 40
      )
          ),
      ),
    );
  }
  
}
