import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medo/home/components/small_service.dart';

class ad_service2 extends StatefulWidget {
  const ad_service2({Key? key}) : super(key: key);

  @override
  _ad_service2State createState() => _ad_service2State();
}

class _ad_service2State extends State<ad_service2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 430,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            small_banner_service(
              img_link: 'assets/chatwithdoctor.jpg',
              img_width: 150,
            ),
            small_banner_service(
              img_link: 'assets/healthtool.jpg',
              img_width: 150,
            ),
            small_banner_service(
              img_link: 'assets/hometest.jpg',
              img_width: 150,
            ),
            small_banner_service(
              img_link: 'assets/haveaquestion.jpg',
              img_width: 150,
            ),
            small_banner_service(
              img_link: 'assets/buymedicineonline.png',
              img_width: 150,
            ),
            small_banner_service(
              img_link: 'assets/calendar.png',
              img_width: 150,
            ),
            small_banner_service(
              img_link: 'assets/corporatehealthcheck.png',
              img_width: 150,
            ),
            small_banner_service(
              img_link: 'assets/genetictesting.png',
              img_width: 150,
            ),
            small_banner_service(
              img_link: 'assets/healthdeclaration.png',
              img_width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
