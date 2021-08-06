import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medo/home/components/small_service.dart';
import 'package:medo/home/functions/buy_medicine/buy_medicine.dart';
import 'package:medo/home/functions/calendar/calendar.dart';
import 'package:medo/home/functions/chat_with_doctor/chat_with_doctor.dart';
import 'package:medo/home/functions/corporator_health/corporator_health.dart';
import 'package:medo/home/functions/genetic_test/genetic_test.dart';
import 'package:medo/home/functions/health_declaration/health_declaration.dart';
import 'package:medo/home/functions/health_tools/health_tools.dart';
import 'package:medo/home/functions/home_test/home_test.dart';
import 'package:medo/home/functions/questions/questions.dart';
import 'package:medo/news/components/web_news_view.dart';

class ad_service extends StatefulWidget {
  const ad_service({Key? key}) : super(key: key);

  @override
  _ad_serviceState createState() => _ad_serviceState();
}

class _ad_serviceState extends State<ad_service> {
  late String imgLink;
  List<String> listImgLink = [
    "assets/chatwithdoctor.jpg",
    "assets/buymedicineonline.png",
    "assets/calendar.png",
    "assets/corporatehealthcheck.png",
    "assets/genetictesting.png",
    "assets/haveaquestion.jpg",
    "assets/healthdeclaration.png",
    "assets/hometest.jpg",
    "assets/healthtool.jpg"
  ];

  tapped(index) {
    switch (index) {
      case 0:
        return chat_with_doctor();
      case 1:
        return ArticleView(
            postUrl: 'https://www.pharmacity.vn/san-pham/page/2/');
      case 2:
        return calendar();
      case 3:
        return corporator_health();
      case 4:
        return genetic_test();
      case 5:
        return question();
      case 6:
        return ArticleView(postUrl: "https://tokhaiyte.vn/");
      case 7:
        return home_test();
      case 8:
        return health_tool();
      default:
        print('wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 430,
      child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: GridView.builder(
            itemCount: 9,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => tapped(index),
                  )),
              child: small_banner_service(
                img_link: listImgLink[index],
                img_width: 150,
              ),
            ),
            shrinkWrap: true,
            primary: false,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 0,
            ),
          )),
    );
  }
}
