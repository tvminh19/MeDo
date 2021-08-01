import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/ad_service.dart';
import 'components/banner.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          banner(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Our Sevices',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w400
            ),
          ),
          ad_service(),
        ],
      ),
    );
  }
}
