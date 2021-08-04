import 'package:flutter/material.dart';
import 'package:medo/personal/components/constants.dart';

class ProfileInfo extends StatelessWidget {
  final String name;
  const ProfileInfo({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: <Widget>[
        Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.only(top: 30),
          child: Stack(
            children: <Widget>[
              CircleAvatar(radius: 50, backgroundColor: Colors.blueAccent),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        shape: BoxShape.circle,
                      ),
                      child:
                          Icon(Icons.edit, color: kDarkPrimaryColor, size: 15)))
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blueAccent),
            child: Center(child: 
            Text('Upgrade to PRO', 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: Colors.white))))
      ]),
    );
  }
}