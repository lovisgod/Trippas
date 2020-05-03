import 'package:flutter/material.dart';
import 'package:trippas/model/trip.dart';
import 'package:trippas/screens/TripList.dart';
import 'package:trippas/screens/tripDetail.dart';
import 'package:trippas/util/dbHelper.dart';

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
    DbHelper dbHelper = DbHelper();
    Trip trip;
    List<String> options = ['Update','Delete'];
    
    _itemState(this.trip);
  @override
  Widget build(BuildContext context) {
  
    // TODO: implement build
    return  Card(
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
                 this.trip.departure,
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
                  border: Border.all(width: 1.0, color: getTypeColor(this.trip)
                  ),
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
                Expanded(child: PopupMenuButton<String>(
                     onSelected: handleOption,
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
        void handleOption(String value) async {
          print(value);
          if (value == 'Update') {
             bool result = await Navigator.push(context, 
            MaterialPageRoute(builder: (context) =>TripDetail(this.trip))
       );
      }
         if (value == 'Delete') {
           dbHelper.deleteTrip(this.trip.id);
           setState(() {});
         }
     }
}