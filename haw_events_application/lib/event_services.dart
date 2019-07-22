import 'package:http/http.dart' as http;

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'event.dart';

import 'package:intl/intl.dart';

EventList eventList;


Future<dynamic> _getEvents() async {
  final response = await http.get(
      Uri.encodeFull('http://141.22.78.164:3010/events'),
      headers: {
        "Accept": "application/json"
      }
    );
    return response.body;
}


Future loadEvent() async {
  String jsonString = await _getEvents(); 
  final jsonResponse = json.decode(jsonString);
  eventList = new EventList.fromJson(jsonResponse);
  //print(eventList.events[0].id);
  //return eventList;
}

EventList getEventList() {
  return eventList;
}

//Formattierung des Datum ISO Strings
String getDate(String isoDate) {
  var formatter = new DateFormat('dd.MM');
  DateTime formattedDate = DateTime.parse(isoDate);
  String formattedDateString = formatter.format(formattedDate);  
  return formattedDateString;
}

String getTime(String isoDate) {
  var formatter = new DateFormat('HH:mm');
  DateTime formattedDate = DateTime.parse(isoDate);
  String formattedDateString = formatter.format(formattedDate);
  return formattedDateString;
}
