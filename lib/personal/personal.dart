import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPersonal extends StatefulWidget {
  const MyPersonal({Key? key}) : super(key: key);

  @override
  _MyPersonalState createState() => _MyPersonalState();
}

class _MyPersonalState extends State<MyPersonal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StackContainer(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => CardItem(),
            shrinkWrap: true,
            itemCount: 6,) 
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0, 
            vertical: 21.0),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.local_hospital,
              size: 40.0,
              color: Colors.blueAccent
            ),
          ),
          SizedBox(width: 24.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Joined date", style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 18.0
              )),
              SizedBox(height: 4.0),
              Text("21 August 2020", style: TextStyle(
                color: Colors.grey[700],
                fontSize: 12.0
              ))
            ]
          )
      ]),
        )),
    );
  }
}

class StackContainer extends StatelessWidget {
  const StackContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310.0,
      child: Stack(
        children: <Widget>[
          Container(),
          ClipPath(
            child: Container(
              height: 240.0,
              color: Colors.greenAccent,
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 50.0,
                ),
                Text("User",
                    style:
                        TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          TopBar(),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}
