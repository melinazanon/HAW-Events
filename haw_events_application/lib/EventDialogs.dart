import 'package:flutter/material.dart';

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
  _EventDialogsState(this.id);

  @override
  Widget build(BuildContext context) {
   
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      //child: _dialogWindow,
    );
  }
}