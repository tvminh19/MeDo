import 'package:flutter/material.dart';
import 'package:medo/models/info.dart';
import 'package:provider/provider.dart';

import 'info_tile.dart';

class InfoList extends StatefulWidget {
  const InfoList({Key? key}) : super(key: key);

  @override
  _InfoListState createState() => _InfoListState();
}

class _InfoListState extends State<InfoList> {
  @override
  Widget build(BuildContext context) {
    final infos = Provider.of<List<Info>>(context);

    return ListView.builder(
      itemCount: infos.length,
      itemBuilder: (context, index) {
        return InfoTile(info: infos[index]);
      },
    );
  }
}
