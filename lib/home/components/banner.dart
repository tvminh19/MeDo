import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:medo/home/components/small_service.dart';

class banner extends StatefulWidget {
  const banner({Key? key}) : super(key: key);

  @override
  _bannerState createState() => _bannerState();
}

class _bannerState extends State<banner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          // enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
          initialPage: 0,
        ),
        items: <Widget>[
          small_banner_service(
            img_link: 'assets/medicine2.jpg',
            img_width: MediaQuery.of(context).size.width,
          ),
          small_banner_service(
            img_link: 'assets/doctor.jpg',
            img_width: MediaQuery.of(context).size.width,
          ),small_banner_service(
            img_link: 'assets/medicine.jpg',
            img_width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}