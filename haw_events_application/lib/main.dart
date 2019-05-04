import 'package:flutter/material.dart';
import 'EventOverview.dart' as eventOverview;
import 'Calender.dart' as calender;
import 'Favourites.dart' as favourite;

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,    //damit das Debug-Banner weggeht
    home: new EventTabs()
  ));
}

class EventTabs extends StatefulWidget {
    EventTabsState createState() => new EventTabsState();

}

class EventTabsState extends State<EventTabs> with SingleTickerProviderStateMixin {

  //Default Controller für die Tabs 
  TabController controller;

  @override
  void initState() {
    super.initState();
    //Parameter length = Anzahl der gewünschten Tabs
    controller = new TabController(vsync: this, length: 3);
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
        title: new Text('HAW EventApp'),
        backgroundColor: Colors.deepPurple ,
        //erstellen der Tabs in der TabBar oben
        /*bottom: new TabBar(
          //Zuweisung des Default-Controllers zur TabBar
          controller: controller,
          //Erstellen der Tabs in der TabBar
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.list)),
            new Tab(icon: new Icon(Icons.calendar_today)),
            new Tab(icon: new Icon(Icons.star)),
          ],
        ),*/
      ),
      bottomNavigationBar: new Material(
        color: Colors.deepPurple,
        child: new TabBar(
          controller: controller,
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
}  
