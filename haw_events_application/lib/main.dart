import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'EventOverview.dart' as eventOverview;
import 'Calender.dart' as calender;
import 'Favourites.dart' as favourite;

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,    //damit das Debug-Banner weggeht
    home: new EventTabs(),
    theme: ThemeData(indicatorColor: Color(0xffa0bedc)),
  ));
}

class EventTabs extends StatefulWidget {
    EventTabsState createState() => new EventTabsState();

}

class EventTabsState extends State<EventTabs> with SingleTickerProviderStateMixin {

  //Default Controller für die Tabs 
  TabController controller;
  //PopupMenuItems Liste mit den drei Punkten
  static const List<String>_choices = <String>["Einstellungen","Impressum"];

  @override
  void initState() {
    super.initState();
    //Parameter length = Anzahl der gewünschten Tabs
    controller = new TabController(vsync: this, length: 3);
    controller.index = 1;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  //

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFF003ca0),
        leading: Image.asset("assets/images/_haw_logo_white.png",
          fit: BoxFit.cover,
          width: 30,
          height: 30,
        ),
        title: new Text('HAW EventApp'),
        actions: <Widget>[
          //Einstellungs DropDownMenu oben rechts in der AppBar
          PopupMenuButton<String>(
            onSelected: choicesAction,
            itemBuilder: (BuildContext context) {
              return _choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList() ;
            },
          )
        ],
      ),
      //erstellen der Tabs in der TabBar oben
      bottomNavigationBar: new Material(
        color: Color(0xFF003ca0),
        child: new TabBar(
          controller: controller,
          indicatorColor: Color(0xffa0bedc),
          //Erstellen der Tabs in der TabBar
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.list)),
            new Tab(icon: new Icon(Icons.calendar_today)),
            new Tab(icon: new Icon(Icons.star)),
          ],
        ),
      ),
      //TabBarView zeigt den Inhalt der Tabs an
      body: new TabBarView(
        //Erneute Zuweisung des Default TabControllers
        controller: controller,
        children: <Widget>[
          //Zuweisung der "Fragmente" an die TabViews
          new eventOverview.EventOverview(),
          new calender.Calender(),
          new favourite.Favourites(),
        ],
      ),
    );
  }

  void choicesAction(String choices) {
    print("Working");
    //Add actual routes to the selected pages
  }
}


