import 'package:flutter/material.dart';
import 'package:trippas/model/trip.dart';

class Item extends StatefulWidget {
  Trip trip;
  Item(this.trip);
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _itemState(this.trip);
      }
    }
    
  class _itemState extends State {
    Trip trip;
    _itemState(this.trip);
    // String departure;
    // String destination;
    // String start_date;
    // String start_time;
    // String end_date;
    // String end_time;
    // String trip_type;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Card(
      child: Container(
        padding: EdgeInsets.all(5.0),
        // width: 200.0,
        // height: 100.0,
        child: Column(
          children: <Widget>[
             Padding(
                 padding: EdgeInsets.only(
                 top: 1.0,
                //  bottom: 2.0
              ),
              child:ListTile(
                title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Expanded(child:Text( 
                 this.trip.departure,
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                Expanded(child:Icon( 
                  Icons.flight_takeoff,
                  color: Colors.grey,
                  size: 24.0,
                  semanticLabel: '',
                )
                ),
                 Expanded(child:Text( 
                 this.trip.destination,
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
                  // bottom: 2.0
              ),
              child:ListTile(
                title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Expanded(child:Text( 
                 this.trip.start_date,
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                Expanded(child:Text( 
                 "",
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                 Expanded(child:Text( 
                 this.trip.start_date,
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
                //  bottom: 2.0
              ),
              child:ListTile(
                title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Expanded(child:Text( 
                 this.trip.start_time,
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                Expanded(child:Text( 
                 "",
                 textDirection: TextDirection.ltr,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),

                )),
                 Expanded(child:Text( 
                 this.trip.end_time,
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
                  // bottom: 2.0
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
                  border: Border.all(width: 1.0, color: Colors.blue),
                  color: getTypeColor(this.trip)
                  ), 
                    child: Text( 
                     this.trip.trip_type,
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
                Expanded(child:Icon( 
                  Icons.more_vert,
                  color: Colors.grey,
                  size: 24.0,
                  semanticLabel: 'Option',
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
                  
              Color getTypeColor(Trip trip) {   
                 switch (trip.trip_type) {
                  case 'Business' :
                   return Colors.blue;
                  break;
                  case 'Education' :
                   return Colors.lightBlue;
                  break;
                  case 'Health' :
                   return Colors.red;
                  break; 
                  case 'Vacation' :
                   return Colors.yellow;
                  break;    
                  default:
                   return Colors.blue;
    }
 }
}