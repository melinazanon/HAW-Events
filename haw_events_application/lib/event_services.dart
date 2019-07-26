import 'package:http/http.dart' as http;
import 'package:haw_events_application/Dialogs.dart' as filter;

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'event.dart';
import 'package:flutter/widgets.dart';


import 'package:intl/intl.dart';

EventList eventList;

Future<String> _getEvents() async {
  //return await rootBundle.loadString('assets/eventsasset.json');
  final response = await http.get(
    //Code zur Verwendung des JSON Assets
    //Uri.encodeFull('http://141.22.78.164:3010/events'),

    //Code zur Verwendung der API-Anbindung
    Uri.encodeFull('http://141.22.78.164:3010/events' + "/" + filter.getArtFilter() + "/" + filter.getDepartmentFilter()),
    headers: {
      "Accept": "application/json"
    }
  );
  return response.body;
}

Future loadEvent() async {
  String jsonString = await _getEvents(); 
  final jsonResponse = json.decode(jsonString);
  //if (jsonResponse != null) {
    eventList = new EventList.fromJson(jsonResponse);
  //}
}

EventList getEventList() {
  return eventList;
}

//Formattierung des Datum ISO Strings
String getDate(String isoDate) {
  var formatter = new DateFormat('dd.MM.');
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
