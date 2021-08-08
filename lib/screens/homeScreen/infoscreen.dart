import 'package:flutter/material.dart';
import 'package:medo/models/info.dart';
import 'package:medo/screens/homeScreen/settings_form.dart';
import 'package:medo/services/auth.dart';
import 'package:medo/services/database.dart';
import 'package:provider/provider.dart';

import 'info_list.dart';

class InfoScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          backgroundColor: Colors.greenAccent[100],
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Info>>.value(
      catchError: (_, err) => [],
      initialData: [],
      value: DatabaseService(uid: '').infos,
      child: Scaffold(
        backgroundColor: Colors.greenAccent[100],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Personal Information'),
          backgroundColor: Colors.blueAccent[100],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.settings),
              label: Text('Setting'),
              style: TextButton.styleFrom(primary: Colors.black),
            )
          ],
        ),
        body: InfoList(),
      ),
    );
  }
}
