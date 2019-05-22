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
  var _currentitemSelected3 = "keine";
  var _currentitemSelected4 = "keine";
  var _veranstaltungsortFilter = ["keine", "Forum","Ditze-Hörsaal","E62","Produktionslabor"];
  var _veranstaltungsartFilter = ["keine", "Workshop","Kolloqium","Rundgang","Ring-Vorlesung"];
  var _department = ["keine", "extern","Medientechnik","Design","Information","gesamte Fakultät"];
  var _uhrzeit = ["keine","8:00 - 12:00 Uhr","12:00 - 16:00 Uhr","16:00-20:00 Uhr"];


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
              borderRadius: BorderRadius.circular(20),
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
                Row(
                  children: <Widget>[
                    _filterText("Ort"),
                    DropdownButton<String>(
                      items: _veranstaltungsortFilter.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._currentitemSelected3 = newValueSelected; 
                        });
                      },
                      value: _currentitemSelected3,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    _filterText("Uhrzeit"),
                    DropdownButton<String>(
                      items: _uhrzeit.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this._currentitemSelected4 = newValueSelected; 
                        });
                      },
                      value: _currentitemSelected4,
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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