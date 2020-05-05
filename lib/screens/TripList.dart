import 'package:flutter/material.dart';
import 'package:trippas/model/trip.dart';
import 'package:trippas/screens/tripDetail.dart';
import 'package:trippas/util/itemLayout.dart';
import 'package:trippas/util/dbHelper.dart';




class TripList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TripListState();
      }
    
    }
    
    class TripListState extends State {
      DbHelper dbHelper = DbHelper();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
          body: Item(),
      );
      }
    

}