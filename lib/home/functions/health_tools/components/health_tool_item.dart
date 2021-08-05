import 'package:flutter/cupertino.dart';

class health_tool_item extends StatefulWidget {
  final String title;
  final String icon;
  final String description;

  const health_tool_item({
    Key? key,
    required this.title,
    required this.icon,
    required this.description,
  }) : super(key: key);

  @override
  _health_tool_itemState createState() => _health_tool_itemState();
}

class _health_tool_itemState extends State<health_tool_item> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
