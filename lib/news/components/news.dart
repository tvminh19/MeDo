import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medo/component/key.dart';
import 'article_model.dart';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String myLink =
        "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=${api_key}";

    var response = await http.get(Uri.parse(myLink));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
