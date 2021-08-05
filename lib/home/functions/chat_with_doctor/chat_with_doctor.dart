import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chat_with_doctor extends StatefulWidget {
  const chat_with_doctor({Key? key}) : super(key: key);

  @override
  _chat_with_doctorState createState() => _chat_with_doctorState();
}

class _chat_with_doctorState extends State<chat_with_doctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check'),
      ),
      body: Text('chat with doctor'),
    );
  }
}
