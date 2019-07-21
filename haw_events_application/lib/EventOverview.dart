import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:haw_events_application/Dialogs.dart';
import 'package:haw_events_application/EventDialogs.dart';
import 'package:haw_events_application/event.dart';
import 'package:haw_events_application/event_services.dart';

class EventOverview extends StatefulWidget {

  final EventList eventList = getEventList();

  EventOverview({
    Key key,  
  }) : super(key: key);

  @override
  _EventOverviewState createState() => _EventOverviewState();
}

class _EventOverviewState extends State<EventOverview> {

  //List<String> data;
  _EventOverviewState();

  @override
  void initState() {
    super.initState();
    //print(data);
  }

  @override
  Widget build(BuildContext context) {

    /*bool isPressed = false;

  _pressed() {
    var newVal = true;
    if(isPressed) {
      newVal = false;
    }
    else {
      newVal = true;
    }

    setState(() {
      isPressed = newVal;
      print(newVal);
    });
  }
  */
    ListTile myListTile(int index) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 11.0,vertical: 3),
      leading: new Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(width: 2,color: Colors.white)
        ),
        child: new Image.asset(
          "assets/images/HAW_Logo_color.jpg",
          fit: BoxFit.cover,
          width: 60,
          height: 60,
        ),
      ),
      title: new Container(
        //padding: EdgeInsets.only(left: 15),
        child: new Text(
          //"Produktionslabor — 09.05",
          eventList.events[index].room + " — " + getDate(eventList.events[index].start),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15
          ),
        )
      ),
      subtitle: Container(
        //padding: EdgeInsets.only(left: 15),
        child: new Text(
          //"Rundgang",
          eventList.events[index].name,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        )
      ),
      trailing: new Container(
        /*new IconButton(
          padding: EdgeInsets.only(right: 8),
          icon: new Icon(isPressed ? Icons.star:Icons.star_border),
          onPressed: () => _pressed(),
          iconSize: 50.0,
          color: Color(0xFFa0bedc),
          
        )*/
        child: Icon(Icons.star_border, color: Colors.grey, size: 50.0)
      ),
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) => EventDialogs(id: index));
      }
    ); 

    SizedBox blueBorder(int index) => new SizedBox(
      height: 100,
      child: Stack(
        children: <Widget>[
          Container(
            height: 250,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            //color: Colors.white,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: new BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey[200],width: 0.5),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black45,
                  offset: new Offset(1.5, 2.5),
                  blurRadius: 7.5
                )
              ]
            ),
          ),
          Container(
            height: 100,
            width: 30,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.bottomCenter,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xFFa0bedc),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(0.0) 
              ),
              //border: Border.all(color: Colors.grey[200],width: 0.5),
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            padding: EdgeInsets.only(top: 4),
            child: myListTile(index),
          )
        ],
      ),
);

    final MyListView = new Container(
      child: ListView.builder(
        //Anzahl der Elemente in der Liste der Veranstaltungen
        itemCount: eventList.events.length,
        itemBuilder: (BuildContext context,int index) {
          return blueBorder(index);
          
        },
        //Leerraum nach dem letzten Element in der Liste
        padding: EdgeInsets.only(bottom: 80),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: MyListView,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(context: context, builder: (BuildContext context) => CustomDialogs()),
        child: Container(
          padding: EdgeInsets.only(top: 5),
          child: Image.asset('assets/images/filter_icon.png', width: 35),
        ),
        backgroundColor: Color(0xFF003ca0),
      ),
    );
  }
}