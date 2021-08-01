import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class banner extends StatefulWidget {
  const banner({ Key? key }) : super(key: key);

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
        ),
        items: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage('assets/medicine2.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage('assets/doctor.jpg'), fit: BoxFit.cover)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage('assets/medicine.jpg'),
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}