import 'package:flutter/material.dart';
import 'package:medo/models/info.dart';

class InfoTile extends StatelessWidget {
  final Info info;
  InfoTile({required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.lightGreen,
          ),
          title: Text(info.name),
          subtitle: Text(info.gender),
        ),
      ),
    );
  }
}
