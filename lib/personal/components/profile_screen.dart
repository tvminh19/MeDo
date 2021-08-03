import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:medo/personal/components/profile_list_item.dart';
import 'package:medo/personal/components/header.dart';

class ProfileScreen extends StatelessWidget {
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
            ProfileListItem(
              icon: Icons.account_circle_rounded,
              text: 'Personal Information',
              hasNavigation: true,
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
            ProfileListItem(
              icon: Icons.logout_rounded,
              text: 'Logout',
              hasNavigation: false,
            ),
          ]))
        ],
      ));
    }));
  }
}
