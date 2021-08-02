import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medo/order/order.dart';
import 'package:medo/personal/personal.dart';
import 'package:medo/search/search.dart';
import 'package:medo/serviceInfomation/service_information.dart';

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
  int _page = 0;
  final MyHome _myHome = MyHome();
  final MyOrder _myOrder = new MyOrder();
  final MySearch _mySearch = new MySearch();
  final MyService _myService = new MyService();
  final MyPersonal _myPersonal = new MyPersonal();

  // Widget _showPage = new myApp();
  Widget _showPage = new MyHome();

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
        return new Container(
            child: new Center(child: new Text('Can not find the page')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Container(child: _showPage),
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          items: const <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search_rounded, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.medical_services, size: 30),
            Icon(Icons.supervised_user_circle_outlined, size: 30),
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

