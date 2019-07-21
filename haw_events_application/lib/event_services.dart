//import 'package:http/http.dart' as http;

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'event.dart';

import 'package:intl/intl.dart';

EventList eventList;

Future<String> _getEvents() async {
  return await rootBundle.loadString('assets/eventsasset.json');
}

  /*
  List<dynamic> data;

  Future<dynamic> getData() async {
    http.Response response = await http.get(
      Uri.encodeFull('https://jsonplaceholder.typicode.com/posts'),
      headers: {
        "Accept": "application/json"
      }
    );
    this.setState(() {
    data = json.decode(response.body);
    });

    print(data[1][1]);
    return "Sucess";
  }
  */


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
