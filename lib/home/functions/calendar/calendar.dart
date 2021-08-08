import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class calendar extends StatefulWidget {
  const calendar({Key? key}) : super(key: key);

  @override
  _calendarState createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check'),
      ),
      body: Text('Calendar'),
    );
  }
}
