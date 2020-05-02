import 'package:flutter/material.dart';
import 'package:trippas/model/trip.dart';
import 'package:trippas/screens/tripDetail.dart';
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
      List<Trip> trips;
      int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    trips = [];
    getData();
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Padding(
                 padding: EdgeInsets.only(
                 top: 10.0,
                 bottom: 10.0
              ),
              child:   
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Expanded(child:Text( 
                 'Hello, User',
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                 Expanded(child:
                 Container(
                 padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  
                ),
                child: Text('$count Trip(s)', style: TextStyle(backgroundColor: Colors.blue),),
               ),     
                ),
          ],
          )
          ),
          Padding(
             padding: EdgeInsets.only(
                 top: 10.0,
                 bottom: 10.0
             ),
             child:  Text( 
                 'Create your trips with us',
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40.0),

              )
               
          )
          ],
        ),
      ),
         floatingActionButton: FloatingActionButton(
            onPressed: () {
            navigateToDetails(Trip(
              "", "", "", "", "", "", ""
            ));
         },
        tooltip: "Add new Todo",
        child: new Icon(Icons.add),
        ),
      );
      }
    
      void getData() {

      }

    void navigateToDetails(Trip trip) async {
       bool result = await Navigator.push(context, 
       MaterialPageRoute(builder: (context) =>TripDetail(trip))
    );
     if(result ==true) {
       getData();
     }
  }

}