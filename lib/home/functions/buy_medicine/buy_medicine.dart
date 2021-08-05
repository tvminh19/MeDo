import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buy_medicine extends StatefulWidget {
  const buy_medicine({Key? key}) : super(key: key);

  @override
  _buy_medicineState createState() => _buy_medicineState();
}

class _buy_medicineState extends State<buy_medicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check'),
      ),
      body: Text('Medicine'),
    );
  }
}
