import 'package:flutter/material.dart';

class EventOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ListTile myListTile() => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
      leading: new Container( 
        margin: EdgeInsets.only(left: 10.0),
        padding: EdgeInsets.only(),  
        child: Icon(Icons.image, color: Colors.black, size: 50.0,),
      ),
      title: new Container(
        padding: EdgeInsets.only(right: 10, bottom: 5),
        child: new Text(
          "Raum -- Datum",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15
          ),
        )
      ),
      subtitle: Container(
        padding: EdgeInsets.only(bottom: 40),
        child: new Text(
          "Veranstaltung",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        )
      ),
      trailing: new Container(
        padding: EdgeInsets.only(left: 10, top: 3),
        child: Icon(Icons.star_border, color: Color(0xFFa0bedc), size: 42.0)
      )
    ); 

    final makeCard = new Container(
      height: 100.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      //padding: EdgeInsets.all(0),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black38,
            offset: new Offset(0.0, 10.0),
            blurRadius: 10.0
          )
        ]
      ),
      child: new Center(
        child: myListTile()
      )
    );

    final MyListView = new Container(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context,int index) {
          return makeCard;
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: MyListView,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.filter),
        backgroundColor: Color(0xFF003ca0),
      ),
    );
  }
}