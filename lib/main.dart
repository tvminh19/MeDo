import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medo/order/order.dart';
import 'package:medo/personal/personal.dart';
import 'package:medo/search/search.dart';
import 'package:medo/news/news_page.dart';

import 'component/app_bar.dart';
import 'home/home.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Medo - Medicine & Doctor',
      debugShowCheckedModeBanner: false,
      home: myAppPage(),
    );
  }
}

class myAppPage extends StatefulWidget {
  const myAppPage({Key? key}) : super(key: key);
  @override
  _myAppPageState createState() => _myAppPageState();
}

class _myAppPageState extends State<myAppPage> {
  final MyHome _myHome = const MyHome();
  final MyOrder _myOrder = const MyOrder();
  final MySearch _mySearch = const MySearch();
  final MyNews _myService = const MyNews();
  final MyPersonal _myPersonal = const MyPersonal();

  // Widget _showPage =  myApp();
  Widget _showPage = const MyHome();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _myHome;
      case 1:
        return _mySearch;
      case 2:
        return _myOrder;
      case 3:
        return _myService;
      case 4:
        return _myPersonal;
      default:
        return const Center(child: Text('Can not find the page'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Container(child: _showPage),
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          items: const <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search_rounded, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.panorama_horizontal_outlined, size: 30),
            Icon(Icons.account_circle_outlined, size: 30),
          ],
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              _showPage = _pageChooser(index);
            });
          },
        ));
  }
}
