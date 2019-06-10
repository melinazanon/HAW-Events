//  Copyright (c) 2019 Aleksander Woźniak
//  Licensed under Apache License v2.0

import 'package:date_utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';


class Calender extends StatefulWidget {
  Calender({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> with TickerProviderStateMixin {
  DateTime _selectedDay;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       //mainAxisSize: MainAxisSize.max,
        //children: <Widget>[
          //Center(
          child: _buildTableCalendar(),
          //const SizedBox(height: 8.0),
          //)],
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      locale: 'en_US',
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      calendarStyle: CalendarStyle(
        weekendStyle: TextStyle(color: Color(0xFF003ca0)),
        outsideWeekendStyle: TextStyle(color: Color(0xFF2453a5)),
        selectedColor: Color(0xffa0bedc),
        todayColor: Color(0xFF003ca0),
        markersColor: Colors.blue[500], 
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Color(0xFF003ca0))
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
      ),
    );
  }
}