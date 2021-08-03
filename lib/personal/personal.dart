import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:medo/personal/components/constants.dart';
import 'package:medo/personal/components/profile_screen.dart';

class MyPersonal extends StatefulWidget {
  const MyPersonal({Key? key}) : super(key: key);

  @override
  _MyPersonalState createState() => _MyPersonalState();
}

class _MyPersonalState extends State<MyPersonal> {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
        initTheme: kLightTheme,
        child: Builder(
          builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeProvider.of(context),
              home: ProfileScreen(),
            );
          },
        ));
  }
}
