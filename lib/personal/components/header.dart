import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:medo/personal/components/constants.dart';
import 'package:medo/personal/components/profile_info.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeswitcher = ThemeSwitcher(builder: (conntext) {
      return AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          crossFadeState:
              ThemeProvider.of(context)?.brightness == Brightness.dark
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
          firstChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(conntext)?.changeTheme(theme: kDarkTheme),
            child: Icon(
              Icons.dark_mode_outlined,
              size: 30,
            ),
          ),
          secondChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(conntext)?.changeTheme(theme: kLightTheme),
            child: Icon(
              Icons.wb_sunny_outlined,
              size: 30,
            ),
          ));
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 30),
        ProfileInfo(name: 'Username'),
        themeswitcher,
        SizedBox(width: 30)
      ],
    );
  }
}