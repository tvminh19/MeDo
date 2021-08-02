import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/ad_service.dart';
import 'components/banner.dart';
import 'components/news_view.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: <Widget>[
        const banner(),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            'Our Services',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const ad_service(),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            'Health News',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const news_view(),
      ],
    );
  }
}
