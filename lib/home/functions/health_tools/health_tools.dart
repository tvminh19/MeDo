import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class health_tool extends StatefulWidget {
  const health_tool({Key? key}) : super(key: key);

  @override
  _health_toolState createState() => _health_toolState();
}

class _health_toolState extends State<health_tool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check'),
      ),
      body: Text('Tools'),
    );
  }
}
