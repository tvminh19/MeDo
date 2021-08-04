import 'package:flutter/cupertino.dart';
import 'components/news_view.dart';

class MyNews extends StatefulWidget {
  const MyNews({Key? key}) : super(key: key);

  @override
  _MyNewsState createState() => _MyNewsState();
}

class _MyNewsState extends State<MyNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, top: 15),
            child: const Text(
              'News',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const news_view()
        ],
      ),
    );
  }
}
