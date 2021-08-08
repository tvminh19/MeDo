import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:medo/personal/components/profile_list_item.dart';
import 'package:medo/personal/components/header.dart';
import 'package:medo/screens/homeScreen/infoscreen.dart';
import 'package:medo/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(child: Builder(builder: (context) {
      return Scaffold(
          body: Column(
        children: [
          Expanded(
              child: ListView(children: <Widget>[
            SizedBox(height: 50),
            Header(),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('Personal Information',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoScreen()));
              },
            ),
            ProfileListItem(
              icon: Icons.favorite_outline_rounded,
              text: 'Favorite',
              hasNavigation: true,
            ),
            ProfileListItem(
              icon: Icons.payment_outlined,
              text: 'Purchase',
              hasNavigation: true,
            ),
            ProfileListItem(
              icon: Icons.help_outline_rounded,
              text: 'Help & Support',
              hasNavigation: true,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('Log out', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ]))
        ],
      ));
    }));
  }
}
