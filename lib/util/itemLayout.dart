import 'package:flutter/material.dart';
import 'package:trippas/model/trip.dart';
import 'package:trippas/screens/tripDetail.dart';
import 'package:trippas/util/dbHelper.dart';

class Item extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _itemState();
      }
    }
    
  class _itemState extends State {
    DbHelper dbHelper = DbHelper();
     List<Trip> trips;
    int count = 0;
    List<String> options = ['Update','Delete'];


    
    _itemState();
  @override
  Widget build(BuildContext context) {
    if (trips == null) {
    trips = [];
    getData();
    }
   // TODO: implement build
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
            onPressed: () {
            navigateToDetails(Trip(
              "", "", "", "", "", "", ""
            ));
         },
        tooltip: "Add new Todo",
        child: new Icon(Icons.add),
        backgroundColor: Color(0xff3E64FF),
        ),
       body:Container(
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
                  border: Border.all(width: 1.0, color: Color(0xff3E64FF)),
                  color: Color(0xff3E64FF)
                  
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
      ));
    }
                  
              Color getTypeColor(Trip trip) {   
                 switch (trip.trip_type) {
                  case 'Business' :
                   return Color(0xff3E64FF);
                  break;
                  case 'Education' :
                   return Color(0xff3EBAFF);
                  break;
                  case 'Hospital' :
                   return Color(0xffFF3E6C);
                  break; 
                  case 'Vacation' :
                   return Color(0xffFFC93E);
                  break;    
                  default:
                   return Color(0xff3E64FF);
    }
 }
        void handleOption(String value, Trip trip) async {
          print(value);
          if (value == 'Update') {
             bool result = await Navigator.push(context, 
            MaterialPageRoute(builder: (context) =>TripDetail(trip))
       );
      }
         if (value == 'Delete') {
           dbHelper.deleteTrip(trip.id);
           getData();       
         }
     }

     Card _item(Trip trip) {
       return Card(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
             Padding(
                 padding: EdgeInsets.only(
                 top: 1.0,
              ),
              child:ListTile(
                title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Expanded(child:Text( 
                 trip.departure,
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                Expanded(child:ImageIcon( 
                   AssetImage(
                   'images/airplane.png',
                  ),
                  color: Colors.grey,
                  size: 24.0,
                  semanticLabel: '',
                )
                ),
                 Expanded(child:Text( 
                 trip.destination,
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
          ],
          ),
          )      
          ),
          Padding(
                 padding: EdgeInsets.only(
                  top: 1.0,
                
              ),
              child:ListTile(
                title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Expanded(child:Text( 
                 trip.start_date,
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                Expanded(child:Text( 
                 "",
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                 Expanded(child:Text( 
                 trip.start_date,
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                )),
            ],
            ),
           )     
          ),
          Padding(
                 padding: EdgeInsets.only(
                 top: 1.0,
              
              ),
              child:ListTile(
                title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Expanded(child:Text( 
                 trip.start_time,
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                Expanded(child:Text( 
                 "",
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                 Expanded(child:Text( 
                 trip.end_time,
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                )),
            ],
            ),
           )     
          ),
          Padding(
                 padding: EdgeInsets.only(
                  top: 1.0,
                
              ),
              child:ListTile(
                title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Expanded(
                 child: Container(
                 padding: EdgeInsets.all(2.0),
                  alignment: Alignment(0.0, 0.0),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(width: 1.0, color: getTypeColor(trip)
                  ),
                  color: getTypeColor(trip)
                  ), 
                    child: Text( 
                     trip.trip_type,
                     textDirection: TextDirection.ltr,
                     style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                  
                     )
                   )
                 ),
                Expanded(child:Text( 
                 "",
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                )),
                Expanded(child: PopupMenuButton<String>(
                     onSelected: (String choice){handleOption(choice, trip);},
                     itemBuilder: (BuildContext context) {
                    return options.map((String choice) {
                     return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                   );
                  }).toList();
                 },
                 )
                 ),
                ],
                ),
               )     
                ),
                ],
                ),
                ),
               );
     }

    ListView tripListItems() {
    return ListView.builder(
     itemCount: count,
     itemBuilder: (BuildContext context, int position) {
       return ListTile(
         title: _item(this.trips[position])
       );
     },
    );
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

   void navigateToDetails(Trip trip) async {
       bool result = await Navigator.push(context, 
       MaterialPageRoute(builder: (context) =>TripDetail(trip))
    );
     if(result ==true) {
       getData();
     }
  }
}