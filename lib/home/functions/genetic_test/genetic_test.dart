import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class genetic_test extends StatefulWidget {
  const genetic_test({Key? key}) : super(key: key);

  @override
  _genetic_testState createState() => _genetic_testState();
}

class _genetic_testState extends State<genetic_test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check'),
      ),
      body: Text('genetic test'),
    );
  }
}
