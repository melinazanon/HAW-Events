import 'package:flutter/material.dart';

//muss außerhalb der Klasse passieren, damit er currentItems nicht beim neu öffnen des Dialogs wieder überschreibt
var _currentitemSelected1 = "keine";
var _currentitemSelected2 = "keine";

class CustomDialogs extends StatefulWidget {
  CustomDialogs({Key key}) : super(key: key);

  @override
  _CustomDialogsState createState() => _CustomDialogsState();
}

class _CustomDialogsState extends State<CustomDialogs> {

  var _veranstaltungsartFilter = ["keine", "Sondervorlesungen","Großveranstaltungen","Filme","Austellungen","Hackathon","Messe","Media Nights","Party","Auftaktveranstaltung","Kolloqium","Konzert","Konferenz"];
  var _department = ["keine", "extern","Medientechnik","Design","Information","DMI gesamt"];


  @override
  Widget build(BuildContext context) {

    //Funktion für Filtertext vor DropDownMenu
    Text _filterText(String title) => Text(
      title,
      style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600
      ),
    );
    
    dialogContent(BuildContext context) {
      return Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0)
                )
              ]
            ),
            child: Column(
              //so eng wie möglich
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //Department Reihe
                Row(
                  children: <Widget>[
                    _filterText("Department"),
                    DropdownButton<String>(
                      items: _department.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          _currentitemSelected1 = newValueSelected; 
                        });
                      },
                      value: _currentitemSelected1,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(height: 10),
                //Art Reihe
                Row(
                  children: <Widget>[
                    _filterText("Art"),
                    DropdownButton<String>(
                      items: _veranstaltungsartFilter.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          _currentitemSelected2 = newValueSelected; 
                        });
                      },
                      value: _currentitemSelected2,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        //Add actual filtering here
                        print(_currentitemSelected1 + _currentitemSelected2);
                      },
                      child: Text("Anwenden", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                      ),
                      FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        //Add actual filtering here
                        //Text zurücksetzten
                        _currentitemSelected1 = "keine";
                        _currentitemSelected2 = "keine";
                      },
                      child: Text("Alle aufheben", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  )
                )
              ],
            ),
          )
        ],
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context)
    );
  }
}