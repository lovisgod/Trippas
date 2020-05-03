import 'package:flutter/material.dart';
import 'package:trippas/model/trip.dart';
import 'package:trippas/util/dbHelper.dart';


// final List<String>tripTypes = const <String> [
//  'Business',
//  'Education',
//  'Health',
//  'Vacation'
// ];
DbHelper dbHelper = DbHelper();

class TripDetail extends StatefulWidget {
  final Trip trip;
  TripDetail(this.trip);
  @override
  State<StatefulWidget> createState() {
    
    return TripDetailState(this.trip);
      }
    
    }
    
  class TripDetailState extends State {
   Trip trip;
   TripDetailState(this.trip);
   String title = '';
   final _types = [
     'Business',
     'Education',
     'Health',
     'Vacation'
     ];
   String _type  = 'Business';
   TextEditingController departController = TextEditingController();
   TextEditingController destController = TextEditingController();
   TextEditingController startDController = TextEditingController();
   TextEditingController startTController = TextEditingController();
   TextEditingController endDController = TextEditingController();
   TextEditingController endTController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    if (this.trip.departure.isEmpty){
      this.title = 'Create Trip';
      debugPrint(this.title);
    } else {
      this.title = 'Update Trip';
      debugPrint(this.title);
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
       automaticallyImplyLeading: true,
         iconTheme: IconThemeData(
         color: Colors.black
       ),
       title: Text(this.title, style: TextStyle(color: Colors.black),),
       backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 10.0
              ),
              child:  TextField( // we can use the onsubmitted here too
              onChanged: (value) => this.updateDeparture(),
              controller: departController,
              decoration: InputDecoration(
                hintText: 'Enter Departure',
                // labelText: 'Departure',
                labelStyle: textStyle,
                // border: InputBorder.none,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              keyboardType: TextInputType.text,
            ),
            ),
             Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 10.0
              ),
              child:   
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Expanded(child:TextField( // we can use the onsubmitted here too
              onChanged: (value) => this.updateStartD(),
              controller: startDController,
              decoration: InputDecoration(
                hintText: 'Enter Date',
                // labelText: 'Price',
                labelStyle: textStyle,
                // border: InputBorder.none
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              keyboardType: TextInputType.datetime,
            )),
            Expanded(child:TextField( // we can use the onsubmitted here too
             onChanged: (value) => this.updateStartT(),
              controller: startTController,
              decoration: InputDecoration(
                hintText: 'Enter Time',
                // labelText: 'Price',
                labelStyle: textStyle,
                // border: InputBorder.none
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              keyboardType: TextInputType.datetime,
            )),
          ],
          )
          ),
           Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 10.0
              ),
              child:  TextField( // we can use the onsubmitted here too
               onChanged: (value) => this.updateDestination(),
              controller: destController,
              decoration: InputDecoration(
                hintText: 'Enter Destination',
                // labelText: 'Departure',
                labelStyle: textStyle,
                // border: InputBorder.none,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              keyboardType: TextInputType.text,
            ),
            ),
             Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 10.0
              ),
              child:   
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Expanded(child:TextField( // we can use the onsubmitted here too
               onChanged: (value) => this.updateEndD(),
              controller: endDController,
              decoration: InputDecoration(
                hintText: 'Enter Date',
                // labelText: 'Price',
                labelStyle: textStyle,
                // border: InputBorder.none
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              keyboardType: TextInputType.datetime,
            )),
            Expanded(child:TextField( // we can use the onsubmitted here too
             onChanged: (value) => this.updateEndT(),
              controller: endTController,
              decoration: InputDecoration(
                hintText: 'Enter Time',
                // labelText: 'Price',
                labelStyle: textStyle,
                // border: InputBorder.none
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
              keyboardType: TextInputType.datetime,
            )),
          ],
          )
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10.0,
                bottom: 10.0
              ),
            child: ListTile( title: DropdownButton<String>(
                        items: this._types.map((String value) {
                           return DropdownMenuItem<String>(
                             value: value,
                             child: Text(value)
                           );
                         }).toList(), 
                         isExpanded: true,
                         style: textStyle,
                         value: this._type,
                         onChanged: (String value) {
                           updateType(value);
                       }
                      )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0
                  ),
                   child: Container( // making the width to infinity makes it fill the page
                       width: double.infinity,
                       child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text(
                         'Save Trip',
                         textScaleFactor: 1.5, // makes the text 50% bigger
                        ),
                        onPressed: () {
                          save();
                        },
                   )
                   )
                  ),
            ],
          ),
        ),
      );
    }
                           
    void updateType(String value) {
      setState(() {
        print(value); 
      this._type = value;
      });
      trip.tripType = value;

    }

    void updateDeparture() {
      trip.departure = departController.text;
    }

    void updateDestination() {
      trip.destination = destController.text;
    }

    void updateStartD() {
      trip.startDate = startDController.text;
    }

    void updateStartT() {
      trip.startTime = startTController.text;
    }

    void updateEndD() {
      trip.endDate = endDController.text;
    }

    void updateEndT() {
      trip.endTime = endTController.text;
    }

    void save() {
      if (trip.id !=null){
        dbHelper.updateTrip(trip);
      }
      else{
        dbHelper.insertTrip(trip);
      }
     Navigator.pop(context, true);
    }
}


//  dbHelper.initializeDb();
//     final tripsFuture = dbHelper.getTrips();
//       tripsFuture.then((result) {
//         List<Trip> tripList = List<Trip>();
//        count = result.length;
//        for (int i=0; i<count;i++) {
//          tripList.add(Trip.fromObject(result[i]));
//          debugPrint(tripList[i].departure);
//        }
//        setState(() {
//          trips = tripList;
//          count = count;
//        });
//        print(trips);
//       });