import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news.dart';
import 'news_item.dart';

class news_view extends StatefulWidget {
  const news_view({Key? key}) : super(key: key);

  @override
  _news_viewState createState() => _news_viewState();
}

class _news_viewState extends State<news_view> {
  late bool _loading;
  var newslist;
  
  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 580,
      child: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: newslist.length,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return NewsTile(
                  imgUrl: newslist[index].urlToImage ?? "",
                  title: newslist[index].title ?? "",
                  desc: newslist[index].description ?? "",
                  content: newslist[index].content ?? "",
                  posturl: newslist[index].articleUrl ?? "",
                );
              }),
    );
  }
}
