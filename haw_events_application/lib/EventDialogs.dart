import 'package:flutter/material.dart';

import 'package:haw_events_application/event.dart';
import 'package:haw_events_application/event_services.dart';

class EventDialogs extends StatefulWidget {

  final int id;

  EventDialogs({
    Key key,
    int id
  }) : this.id = id, super(key: key);

  @override
  State<StatefulWidget> createState() => _EventDialogsState(id);
}

class _EventDialogsState extends State<EventDialogs> {

  int id;
  final EventList eventList = getEventList();
  _EventDialogsState(this.id);

  @override
  Widget build(BuildContext context) {
    
   //zur Berechnung der Verhältnisse im Dialogsfenster
    const double cardHeight = 158;
    const double dialogWidth = 280;
    const double streifenWidth = 0.1;
    const double dialogHeightText = 311;

  
    final _lowerDialogWindow = Row(
            children: <Widget>[
              //Akzent-Streifen
              Container(
                width: MediaQuery.of(context).size.width *streifenWidth,
                height: dialogHeightText,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0)),
                  color: Color(0xff003ca0)),
              ),
              //Informationen
              Container(
                width: MediaQuery.of(context).size.width*(1-streifenWidth)-80,
                height: dialogHeightText,
                padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0)),
                  color: Colors.white
                ),
                child: 
                  //Kerndaten
                  Column(children: <Widget>[
                    //Hier Methode fürs Anzeigen des Datums (Unterscheidung, ob mehrtägig oder nicht)
                    Text(getDate(eventList.events[id].start) +"  "+ getTime(eventList.events[id].start)  +" - "+ getTime(eventList.events[id].end), style: TextStyle(fontSize: 17, color: Colors.grey,)),
                    Text(eventList.events[id].room, style: TextStyle(fontSize: 17, color: Colors.grey,),),
                    Text(eventList.events[id].name, style: TextStyle(fontSize: 21, color: Colors.black, fontWeight: FontWeight.bold),),
                    Text(eventList.events[id].type, style: TextStyle(fontSize: 17, color: Colors.grey,)),
                    Text(eventList.events[id].department, style: TextStyle(fontSize: 17, color: Colors.grey,)),
                    SizedBox(height: 5),
                    //Beschreibung
                    Container(
                      width: 190,
                      height: 127,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(5),
                        child: new Text(
                          eventList.events[id].description,
                          style: TextStyle(fontSize: 15),),
                      ),
                      //color: Colors.blue,
                    ),
                    //Website-Button
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: FlatButton(
                        onPressed: () { //Link zur möglichen Website (Abfangen, ob Link existiert oder nicht)
                        },
                        child: Text(
                          //abfrage, ob es eine Website gibt oder nicht
                          eventList.events[id].website != null?eventList.events[id].website:"", 
                          style: TextStyle(
                            fontSize: 17.5, 
                            color: Color(0xff003ca0), 
                            fontWeight: FontWeight.w700)
                          ),
                      ),            
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              )
            ]
          );

    final _upperDialogWindow = Stack(
              children: <Widget>[
                //Veranstaltungsbild
                Container(  
                  width: MediaQuery.of(context).size.width,
                  height: cardHeight,
                  child: Card(
                    elevation: 0.0,
                    color: Color(0x00ffffff),
                    margin: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0)
                      )
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "assets/images/Flimmerfest.jpg",
                      height: cardHeight,
                      width: dialogWidth,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                //Der Farbverlauf über dem Bild (vorheriger Containerm weil Stack)
                Container(
                  height: cardHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.3, 0.4, 0.6],
                      colors: [
                        Color(0x88333333),
                        Color(0x55333333),
                        Color(0x22333333),
                        Color(0x00333333)
                      ]
                    )
                  ),
                ),
                //Buttons
                Row(
                  children: <Widget>[
                    //Schließen-Button
                    IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(bottom: 20),
                    icon: Icon(Icons.clear, color: Colors.grey),
                    onPressed: () => Navigator.of(context).pop()
                    ),
                    //Favorit-Button
                    IconButton(
                      //padding: EdgeInsets.only(left: 217, top: 3),
                      iconSize: 50.0,
                      icon: Icon(Icons.star_border, color: Colors.grey,),
                      onPressed: () {},
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
              ],
    );

    final _dialogWindow = Container(   
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0)
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                _upperDialogWindow,
                _lowerDialogWindow
              ]
            )
    );

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _dialogWindow,
    );
  }
}