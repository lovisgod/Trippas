class Trip {
  int _id;
  String _departure;
  String _destination;
  String _start_date;
  String _end_date;
  String _start_time;
  String _end_time;
  String _trip_type;


  Trip(this._departure, this._destination, this._start_date, 
    this._end_date, this._start_time, this._end_time, this._trip_type);
  Trip.withId(this._id, this._departure, this._destination, this._start_date, 
          this._end_date, this._start_time, this._end_time, this._trip_type);

  int get id => _id;
  String get departure => _departure;
  String get destination => _destination;
  String get start_date => _start_date;
  String get end_date => _end_date;
  String get start_time => _start_time;
  String get end_time => _end_time;
  String get trip_type => _trip_type;

  set departure (String departure) {
    if (departure.length <= 255) {
      _departure =departure;
    }
  }
  set destination (String destination) {
    if (destination.length <= 255) {
      _destination =destination;
    }
  }

  set startDate (String start_date) {
    _start_date = start_date;
  }

  set startTime (String start_time) {
    _start_time = start_time;
  }

  set endDate (String end_date) {
    _end_date = end_date;
  }

  set endTime (String end_time) {
    _end_time = end_time;
  } 

  set tripType (String trip_type) {
    _trip_type = trip_type;
  }


  Map <String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map['departure'] = _departure;
    map['destination'] = _destination;
    map['start_date'] = _start_date;
    map['end_date'] =_end_date;
    map['start_time'] =_start_time;
    map['end_time'] =_end_time;
    map['trip_type'] =_trip_type;
    if (_id !=null) {
      map['id'] = _id;
    }
    return map;
  }

  Trip.fromObject(dynamic o) {
    this._id = o['id'];
    this._departure = o['departure'];
    this._destination = o['destination'];
    this._start_date = o['start_date'];
    this._end_date = o['end_date'];
    this._start_time = o['start_time'];
    this._end_time = o['end_time'];
    this._trip_type = o['trip_type'];
  }
}