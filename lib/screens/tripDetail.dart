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
   String _type  = 'Trip type';
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
    } else {
      this.title = 'Update Trip';
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
       automaticallyImplyLeading: true,
       title: Text(this.title),
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
              controller: departController,
              decoration: InputDecoration(
                hintText: 'Enter Departure',
                // labelText: 'Departure',
                labelStyle: textStyle,
                border: InputBorder.none,
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(5.0)
                // )
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
              controller: startDController,
              decoration: InputDecoration(
                hintText: 'Enter Date',
                // labelText: 'Price',
                labelStyle: textStyle,
                border: InputBorder.none
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(5.0)
                // )
              ),
              keyboardType: TextInputType.datetime,
            )),
            Expanded(child:TextField( // we can use the onsubmitted here too
              controller: startTController,
              decoration: InputDecoration(
                hintText: 'Enter Time',
                // labelText: 'Price',
                labelStyle: textStyle,
                border: InputBorder.none
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(5.0)
                // )
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
              controller: destController,
              decoration: InputDecoration(
                hintText: 'Enter Destination',
                // labelText: 'Departure',
                labelStyle: textStyle,
                border: InputBorder.none,
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(5.0)
                // )
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
              controller: endDController,
              decoration: InputDecoration(
                hintText: 'Enter Date',
                // labelText: 'Price',
                labelStyle: textStyle,
                border: InputBorder.none
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(5.0)
                // )
              ),
              keyboardType: TextInputType.datetime,
            )),
            Expanded(child:TextField( // we can use the onsubmitted here too
              controller: endTController,
              decoration: InputDecoration(
                hintText: 'Enter Time',
                // labelText: 'Price',
                labelStyle: textStyle,
                border: InputBorder.none
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(5.0)
                // )
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
                        items: _types.map((String value) {
                           return DropdownMenuItem<String>(
                             value: value,
                             child: Text(value)
                           );
                         }).toList(), 
                         style: textStyle,
                         value: _type,
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
                   child: RaisedButton(
                        color: Colors.blue,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                         'Save Trip',
                         textScaleFactor: 1.5, // makes the text 50% bigger
                        ),
                        onPressed: () {
                          save();
                        },
                   )
                  ),
            ],
          ),
        ),
      );
    }
                           
    void updateType(String value) {
      this._type = value;
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