import 'package:flutter/material.dart';

class CustomDialogs extends StatefulWidget {
  CustomDialogs({Key key}) : super(key: key);

  @override
  _CustomDialogsState createState() => _CustomDialogsState();
}

class _CustomDialogsState extends State<CustomDialogs> {

  //var _filteroptionen = ["keine", "filter1","filter2","filter3"];
  var _currentitemSelected1 = "keine";
  var _currentitemSelected2 = "keine";
  var _veranstaltungsartFilter = ["keine", "Workshop","Kolloqium","Großveranstaltungen","Ring-Vorlesung","Filme","Austellungen","GameJams","Media Night","Messe"];
  var _department = ["keine", "extern","Medientechnik","Design","Information","DMI gesamt"];


  @override
  Widget build(BuildContext context) {

    Text _filterText(String title) => Text(
      title,
      style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700
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
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
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
                          this._currentitemSelected1 = newValueSelected; 
                        });
                      },
                      value: _currentitemSelected1,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(height: 10),
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
                          this._currentitemSelected2 = newValueSelected; 
                        });
                      },
                      value: _currentitemSelected2,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      //Add actual filtering here
                    },
                    child: Text("Filter anwenden", style: TextStyle(fontSize: 17.5)),
                  ),
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