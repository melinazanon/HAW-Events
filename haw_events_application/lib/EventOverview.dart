import 'package:flutter/material.dart';

class EventOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ListTile myListTile() => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 20.0),
        decoration: new BoxDecoration(
          border: new Border(
            right: new BorderSide(width: 1.0, color: Colors.black)
          )
        ),
        child: Icon(Icons.image, color: Colors.black),
      ),
      title: new Text(
        "Eventtitel",
        style: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Row(
        children: <Widget>[
          Text(
            "Eventbeschreibung",
            style: TextStyle(
              color: Colors.black
            ),
          ),
          Text(
            "Department",
            style: TextStyle(
              color: Colors.black
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      trailing: 
        Icon(Icons.star_border, color: Colors.white, size: 30.0)
    ); 

    final makeCard = new Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: myListTile(),
      ),
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
      ),
    );
  }
}