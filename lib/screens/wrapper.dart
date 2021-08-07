import 'package:flutter/material.dart';
import 'package:medo/models/the_user.dart';
import 'package:medo/screens/authenticate/authenticate.dart';
import 'package:medo/screens/homeScreen/homescreen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser?>(context);
    print(user);
    // return either home or authenticate widget
    if (user == null)
      return Authenticate();
    else
      return myAppPage();
  }
}
