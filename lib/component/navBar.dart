import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: const <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.search_rounded, size: 30),
        Icon(Icons.add, size: 30),
        Icon(Icons.medical_services, size: 30),
        Icon(Icons.supervised_user_circle_outlined, size: 30),
      ],
      backgroundColor: Colors.greenAccent,
    );
  }
}
