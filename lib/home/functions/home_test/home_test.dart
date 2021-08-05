import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home_test extends StatefulWidget {
  const home_test({Key? key}) : super(key: key);

  @override
  _home_testState createState() => _home_testState();
}

class _home_testState extends State<home_test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check'),
      ),
      body: Text('home test'),
    );
  }
}
