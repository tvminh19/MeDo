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
            const StackContainer(),
            // ListView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemBuilder: (context, index) => const CardItem(),
            //   shrinkWrap: true,
            //   itemCount: 4,
            // ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                CardItem(title: 'Full information'),
                CardItem(title: 'Your History',),
                CardItem(title: 'Award',),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;

  const CardItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 21.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon:
                    Icon(Icons.settings, size: 40.0, color: Colors.blueAccent),
              ),
              SizedBox(width: 24.0),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(title, style: const TextStyle(fontSize: 18.0)),
                    const SizedBox(height: 4.0),
                    Text("21 August 2020",
                        style:
                            TextStyle(color: Colors.grey[700], fontSize: 12.0))
                  ])
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
          ClipPath(
            child: Container(
              height: 220.0,
              color: Colors.greenAccent,
            ),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 80.0,
                ),
                Text("User",
                    style:
                        TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          const TopBar(),
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
            icon: const Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}
