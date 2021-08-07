import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class health_declaration extends StatefulWidget {
  const health_declaration({Key? key}) : super(key: key);

  @override
  _health_declarationState createState() => _health_declarationState();
}

class _health_declarationState extends State<health_declaration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check'),
      ),
      body: Text('Health declaration'),
    );
  }
}
