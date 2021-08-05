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
          title: Text("Health's tool"),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage('assets/woman.png'),
                            fit: BoxFit.cover)),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
