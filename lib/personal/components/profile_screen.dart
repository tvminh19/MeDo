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
    showInfoScreen() => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InfoScreen()))
        };
    logout() async {
      await _auth.signOut();
    }
    doSth() => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Function not available!"),
          ))
        };
    return ThemeSwitchingArea(child: Builder(builder: (context) {
      return Scaffold(
          body: Column(
        children: [
          Expanded(
              child: ListView(children: <Widget>[
            SizedBox(height: 50),
            Header(),
            SizedBox(height: 20),
            ProfileListItem(
              icon: Icons.person,
              text: 'Personal Information',
              hasNavigation: true,
              callback: showInfoScreen,
            ),
            ProfileListItem(
              icon: Icons.favorite_outline_rounded,
              text: 'Favorite',
              hasNavigation: true,
              callback: doSth,
            ),
            ProfileListItem(
              icon: Icons.payment_outlined,
              text: 'Purchase',
              hasNavigation: true,
              callback: doSth,
            ),
            ProfileListItem(
              icon: Icons.help_outline_rounded,
              text: 'Help & Support',
              hasNavigation: true,
              callback: doSth,
            ),
            ProfileListItem(
              icon: Icons.logout,
              text: 'Log-out',
              hasNavigation: true,
              callback: logout,
            ),
          ]))
        ],
      ));
    }));
  }
}
