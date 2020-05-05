import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
     'Hospital',
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
    this.departController.text = this.trip.departure;
    this.destController.text = this.trip.destination;
    this.startDController.text = this.trip.start_date;
    this.startTController.text  = this.trip.start_time;
    this.endDController.text = this.trip.end_date;
    this.endTController.text = this.trip.end_time;
    // if (this.trip.trip_type.isNotEmpty) {
    //   this._type = this.trip.trip_type;
    // }
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
        child:LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child:
        Column(
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
              onTap: () {
                  DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2020, 1, 1),
                              maxTime: DateTime(2030, 6, 7), onChanged: (date) {
                            print('change $date');
                            startDController.text = '${date.day} ${this.getMonth(date.month)} ${date.year}';
                            this.updateStartD();
                          }, onConfirm: (date) {
                            print('confirm $date');
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
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
               onTap: () {
                  DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2020, 1, 1),
                              maxTime: DateTime(2030, 6, 7), onChanged: (date) {
                            print('change $date');
                            endDController.text = '${date.day} ${this.getMonth(date.month)} ${date.year}';
                            this.updateEndD();
                          }, onConfirm: (date) {
                            print('confirm $date');
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
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
                        color: Color(0xff3E64FF),
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
          )
          )
          );}
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

    String getMonth(int value) {
      switch (value) {
        case 1:
           return 'Jan';
        break;
        case 2:
           return 'Feb';
        break;
        case 3:
           return 'Mar';
        break;
        case 4:
           return 'April';
        break;
        case 5:
           return 'May';
        break;
        case 6:
           return 'Jun';
        break;
        case 7:
           return 'July';
        break;
        case 8:
           return 'Aug';
        break;
        case 9:
           return 'Sep';
        break;
        case 10:
           return 'Oct';
        break;
        case 11:
           return 'Nov';
        break;
        case 12:
           return 'Dec';
        break;
        default:
      }
    }
}
