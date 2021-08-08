import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class question extends StatefulWidget {
  const question({Key? key}) : super(key: key);

  @override
  _questionState createState() => _questionState();
}

class _questionState extends State<question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check'),
      ),
      body: Text('questions'),
    );
  }
}
