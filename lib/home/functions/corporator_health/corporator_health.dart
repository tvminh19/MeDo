import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class corporator_health extends StatefulWidget {
  const corporator_health({Key? key}) : super(key: key);

  @override
  _corporator_healthState createState() => _corporator_healthState();
}

class _corporator_healthState extends State<corporator_health> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check'),
      ),
      body: Text('corporator health'),
    );
  }
}
