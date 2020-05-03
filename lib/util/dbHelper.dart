import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:trippas/model/trip.dart';

class DbHelper {
  DbHelper._internal(); // db helper singleton constructor
  static final DbHelper _dbHelper = DbHelper._internal(); // create an object of db object instance
  String tblTrip = 'trip';
  String colId = 'id';
  String colDeparture = 'departure';
  String colDestination = 'destination';
  String colStartDate = 'start_date';
  String colEndDate = 'end_date';
  String colStartTime = 'start_time';
  String colEndTime = 'end_time';
  String colTripType = 'trip_type';


  factory DbHelper() {
    return _dbHelper;
  } // a constructor that creates a singleton

// this variable hold instance to db;
static Database _db;

Future<Database> get db async {
  if (_db == null) {
    _db = await initializeDb();
  }
  return _db;
}
  // create or open a db
  Future<Database> initializeDb() async {
    Directory dir = await getApplicationSupportDirectory();
    String path = dir.path + 'trip.db';
    var dbTrips = await openDatabase(path, version: 1, onCreate: _createDb); // this open or create a new db
    return dbTrips;
    }
    
      void _createDb(Database db, int version) async {
        await db.execute(
          "CREATE TABLE $tblTrip($colId INTEGER PRIMARY KEY, $colDeparture TEXT," +
           "$colDestination TEXT, $colStartDate TEXT, $colEndDate TEXT, $colStartTime TEXT, $colEndTime TEXT, $colTripType TEXT)"
        );
  }

  // query methods comes here
  Future<int> insertTrip(Trip trip) async {
    Database db = await this.db;
    var result = await db.insert(tblTrip, trip.toMap());
    debugPrint(result.toString());
    return result; // if the integer returned is zero, something is wrong. It must be the id of the row created
  }

  Future<List> getTrips() async {
    Database db = await this.db;
    var result = await db.rawQuery("SELECT * FROM $tblTrip order by $colId ASC");
    return result;
  }

  Future<int>getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
      await db.rawQuery("select count(*) from $tblTrip")
    );
    return result;
  }

  Future<int> updateTrip(Trip trip) async {
    var db = await this.db;
    var result = await db.update(tblTrip, trip.toMap(), where:"$colId = ?", whereArgs: [trip.id]);
    return result;
  }

  Future<int> deleteTrip(int id) async {
    int result;
    var db = await this.db;
    result =await db.rawDelete("DELETE FROM $tblTrip WHERE $colId = $id");
    return result;
  }
}