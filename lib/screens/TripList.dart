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
      List<Trip> trips;
      int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (trips == null) {
    trips = [];
    getData();
    }
    return Scaffold(
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Padding(
                 padding: EdgeInsets.only(
                 top: 30.0,
                 bottom: 10.0
              ),
              child:ListTile(
                title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Expanded(child:Text( 
                 'Hello, User',
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                Expanded(child:Text( 
                 "",
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                 Expanded(child:
                 Container(
                 padding: EdgeInsets.all(4.0),
                  alignment: Alignment(0.0, 0.0),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(width: 1.0, color: Colors.blue),
                  color: Colors.blue
                  
                ),
                child: Text('$count Trip(s)', style: TextStyle(color: Colors.white)),
               ),     
                ),
          ],
          ),
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
               
          ),
          Padding(
             padding: EdgeInsets.only(
                 top: 10.0,
                 bottom: 10.0
             ),
             child: Container(
               height: 500,
               child: tripListItems()
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
        backgroundColor: Colors.blue,
        ),
      );
      }
    
      

    void navigateToDetails(Trip trip) async {
       bool result = await Navigator.push(context, 
       MaterialPageRoute(builder: (context) =>TripDetail(trip))
    );
     if(result ==true) {
       getData();
     }
  }

  ListView tripListItems() {
    return ListView.builder(
     itemCount: count,
     itemBuilder: (BuildContext context, int position) {
       return ListTile(
         title: Item(trips[position])
       );
     },
    );
  }

  void event (String tt) {
    if (tt== 'yes') {
      getData();
    }
  }

  void getData() {
    try {
      final dbFuture = dbHelper.initializeDb();
      dbFuture.then((result) {
         final tripsFuture = dbHelper.getTrips();
        tripsFuture.then((value) {
           List<Trip> tripLists = List<Trip>();
           for (var item in value) {
           tripLists.add(Trip.fromObject(item));
            debugPrint(tripLists[0].departure);
      }
       setState(() {
        trips = tripLists;
        count = tripLists.length;
   });

   });
  });
  } catch (e) {
      debugPrint(e);
  }
    
  }

}