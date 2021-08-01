import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medo/home/components/small_service.dart';

class ad_service extends StatefulWidget {
  const ad_service({Key? key}) : super(key: key);

  @override
  _ad_serviceState createState() => _ad_serviceState();
}

class _ad_serviceState extends State<ad_service> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            small_banner_service(
              img_link: 'assets/doctor.jpg',
              img_width: 150,
            ),
            small_banner_service(
              img_link: 'assets/medicine.jpg',
              img_width: 150,
            )
          ],
        ));
  }
}
