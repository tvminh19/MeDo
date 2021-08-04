import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigation;

  ProfileListItem({
    Key? key,
    required this.icon,
    this.hasNavigation = false,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        margin: EdgeInsets.symmetric(horizontal: 40).copyWith(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).backgroundColor),
        child: Row(
          children: <Widget>[
            Icon(this.icon, size: 25),
            SizedBox(width: 25),
            Text(this.text),
            Spacer(),
            if (this.hasNavigation)
              Icon(Icons.arrow_forward_ios_rounded, size: 25)
          ],
        ));
  }
}